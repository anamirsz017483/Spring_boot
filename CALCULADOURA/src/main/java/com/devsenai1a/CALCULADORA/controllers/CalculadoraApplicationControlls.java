package com.devsenai1a.CALCULADORA.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CalculadoraApplicationControlls {
	@GetMapping("/somar")
	public double somar(@RequestParam double a, @RequestParam double b) {
		return a + b;
	}
	
	//colocar os metodos subtrair, multiplicar e dividir
	
	@PostMapping("/calcular")
	@ResponseBody
	public Map<String, Object>calcularJson(
			@RequestParam double num1,
			@RequestParam double num2,
			@RequestParam String operacao){
		
		double resultado =0;
		String erro =null;
		
		switch(operacao) {
		case "somar": resultado = num1 + num2; break;
		case "subtrair" : resultado= num1 - num2; break;
		case "multiplicar" : resultado = num1 * num2; break;
		case "dividir" : 
			if(num2==0) erro = "divisão por zero não é permitida.";
			else resultado = num1 / num2; break;
			default: erro = "operação invalida";
		}
		Map<String, Object> resp = new HashMap<>();
		resp.put("resultado: ", resultado);
		resp.put("erro: ", erro);
		return resp;
	}
}
                                                         