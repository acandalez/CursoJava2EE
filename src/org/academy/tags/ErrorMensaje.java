package org.academy.tags;

import javax.servlet.jsp.tagext.SimpleTagSupport;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

public class ErrorMensaje extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {
		final JspWriter out = getJspContext().getOut();
		out.println( "<div class=\"alert alert-danger\">No se han realizado los cambios, por favor intentelo de nuevo</div>" );
	}
}
