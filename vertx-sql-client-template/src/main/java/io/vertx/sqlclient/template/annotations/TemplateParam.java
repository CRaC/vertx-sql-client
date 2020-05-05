package io.vertx.sqlclient.template.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Annotate a Vert.x data object property for custom configuration when this property when
 * it is mapped to a template parameter.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD, ElementType.FIELD})
public @interface TemplateParam {

  /**
   * @return the template parameter name
   */
  String name() default "";

}
