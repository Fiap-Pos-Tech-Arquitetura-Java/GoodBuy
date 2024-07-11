package br.com.fiap.postech.goodbuy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class GoodBuyApplication {

	public static void main(String[] args) {
		SpringApplication.run(GoodBuyApplication.class, args);
	}

	@Value("${goodbuy.user.host}")
	String userHost;

	@Value("${goodbuy.item.host}")
	String itemHost;

	@Value("${goodbuy.shop-cart.host}")
	String shopCartHost;

	@Value("${goodbuy.payment.host}")
	String paymentHost;

	@Bean
	public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
		return builder.routes()
				.route("user", r -> r.path("/goodbuy/user/**")
						.and()
						.not( p->p.path("/goodbuy/user/findByLogin/**"))
						//.filters(f -> f.stripPrefix(1))
						.uri("http://" + userHost + ":8080"))
				.route("item", r -> r.path("/goodbuy/item/**")
						//.filters(f -> f.stripPrefix(1))
						.uri("http://" + itemHost + ":8081"))
				.route("shop-cart", r -> r.path("/goodbuy/shop-cart/**")
						//.filters(f -> f.stripPrefix(1))
						.uri("http://" + shopCartHost + ":8082"))
				.route("payment", r -> r.path("/goodbuy/payment/**")
						//.filters(f -> f.stripPrefix(1))
						.uri("http://" + paymentHost + ":8083"))
				.build();
	}
}