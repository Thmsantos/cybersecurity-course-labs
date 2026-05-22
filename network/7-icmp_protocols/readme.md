# Protocolos de Rede: ICMP e Diagnóstico

Quando algo dá errado na rede (um cabo solta, um roteador desliga), os computadores precisam de uma forma de avisar sobre o erro. É para isso que serve o **ICMP (Internet Control Message Protocol)**.

## O que é o ICMP?

O ICMP não transporta dados de aplicativos (como o TCP e UDP fazem). Ele transporta mensagens de controle e erro da própria rede.
Por exemplo, se um roteador não consegue entregar o seu pacote, ele te devolve uma mensagem ICMP dizendo "Destination Unreachable" (Destino Inalcançável).

## Ferramentas Baseadas no ICMP

Duas das ferramentas mais famosas de diagnóstico de rede usam o ICMP:

### 1. Ping
O Ping envia uma mensagem ICMP do tipo *Echo Request* (Pedido de Eco) para um destino. Se o destino estiver online e não estiver bloqueando ICMP, ele responde com um *Echo Reply* (Resposta de Eco).
- **Para que serve:** Testar conectividade básica e medir a "latência" (o tempo que o pacote levou para ir e voltar, medido em milissegundos - ms).

### 2. Traceroute / MTR
Como vimos antes, ele descobre a rota que o pacote faz. Ele faz isso enviando pacotes com um TTL (Time To Live) progressivo. Quando o pacote "morre" no roteador número 1, o roteador envia um erro ICMP ("Time Exceeded") de volta, revelando seu IP. Depois ele tenta pro roteador 2, e assim por diante.
- **Para que serve:** Descobrir exatamente em qual ponto (roteador/provedor) a conexão está caindo ou ficando lenta.

---

## 💻 Prática: Diagnosticando Falhas

Vamos usar o ping com alguns parâmetros avançados para simular testes reais de rede.
Rode o script `07-diagnostico-icmp.sh`.
