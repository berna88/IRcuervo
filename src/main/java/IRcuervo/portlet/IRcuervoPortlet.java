package IRcuervo.portlet;

import IRcuervo.constants.IRcuervoPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author Bernardo Hernández Ramírez
 * @version 1.0.0
 * @since 2020-02-26
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=root//Cuervo//Intranet",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + IRcuervoPortletKeys.IRcuervo,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class IRcuervoPortlet extends MVCPortlet {
}