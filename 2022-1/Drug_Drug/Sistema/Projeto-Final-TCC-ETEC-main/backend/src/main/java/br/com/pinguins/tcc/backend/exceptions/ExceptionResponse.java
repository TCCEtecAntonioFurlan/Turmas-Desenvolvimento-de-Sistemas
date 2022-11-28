package br.com.pinguins.tcc.backend.exceptions;

public class ExceptionResponse {

    public String message;
    public String detalhes;

    public ExceptionResponse(String message, String detalhes) {
        this.message = message;
        this.detalhes = detalhes;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDetalhes() {
        return detalhes;
    }

    public void setDetalhes(String detalhes) {
        this.detalhes = detalhes;
    }
}
