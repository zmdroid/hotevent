package com.cold.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.cold.util.Config;
/**
 * 初始化系统全局配置，并放入内存
 * @author ken
 *
 */
public class InitSystemListener implements ServletContextListener{
	Logger logger = Logger.getLogger(InitSystemListener.class);
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		Map<String,Object> properties = new HashMap<String,Object>();
		/****************1.加载静态配置文件****************/
		//加载属性文件
		final ResourceBundle resource = ResourceBundle.getBundle("cold");
	
		for(Object key:resource.keySet()){
			properties.put(key+"", resource.getObject(key+""));
		}
		
		/****************2.加载动态配置文件****************/
		//put into the properties...
		
		/****************3.注入全局config****************/
		Config config  = Config.getInstance();
		config.setProperties(properties);

		logger.info("System config loaded...");
	}
}