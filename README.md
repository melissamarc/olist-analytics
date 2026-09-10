### **Contexto**

### A Olist é uma marketplace brasileira real que conecta pequenos lojistas a grandes marketplaces (Mercado Livre, Amazon, B2W). O dataset público traz +100 mil pedidos reais e anonimizados, com informações de clientes, produtos, vendedores, pagamentos, frete e avaliações.

### **Objetivo do projeto** ###

### Simular a rotina de um analista de dados dentro de uma marketplace: entender o comportamento de compra, a experiência de entrega e a satisfação do cliente, entregando recomendações de negócio.

### Perguntas de negócio a responder
1. Quais categorias de produto geram mais receita?
2. Quais categorias têm mais avaliações negativas e por quê (atraso, produto diferente do anunciado, etc.)?
3. Qual o tempo médio de entrega por estado e ele impacta a nota do cliente?
4. Quais formas de pagamento e faixas de parcelamento são mais usadas por faixa de valor?
5. Existe sazonalidade nas vendas (dias da semana, meses, datas comemorativas)?
6. Quais vendedores têm melhor desempenho (volume x avaliação)?


### Etapas do projeto:
**Etapa 1 — Preparação**
- Baixar os CSVs e importar para um banco (MySQL, PostgreSQL ou SQLite)
- Montar o diagrama de entidade e relacionamento (ER) das 9 tabelas
- Fazer a limpeza inicial: checar duplicados, valores nulos em datas de entrega, formatos de data

**Etapa 2 — Exploração e consultas em SQL**
- Escrever queries de JOIN unindo pedidos, clientes, produtos, pagamentos e avaliações
- Criar consultas agregadas: receita por categoria, ticket médio por estado, taxa de atraso por região
- Criar uma view ou tabela auxiliar já com as métricas principais calculadas, para facilitar a conexão com o Power BI

**Etapa 3 — Excel (apoio pontual)**
- Exportar uma amostra ou o resultado de uma query para Excel
- Montar uma tabela dinâmica cruzando "atraso de entrega" x "nota da avaliação" para validar uma hipótese antes de levar pro dashboard

**Etapa 4 — Dashboard em Power BI**
- Conectar o Power BI ao banco (ou aos CSVs/queries exportadas)
- Construir: mapa do Brasil por estado (vendas e atraso médio), funil de status do pedido, KPIs de receita/ticket médio/satisfação, gráfico de sazonalidade
- Adicionar filtros por categoria, estado e período

**Etapa 5 — Documentação**
- README no GitHub: contexto da Olist, perguntas respondidas, prints do dashboard, principais insights e recomendações de negócio
- Deixar claro no README quais partes foram feitas com SQL, Excel e Power BI

**Etapa 6 — Evolução futura (Python)**
- Análise de sentimento nos comentários das avaliações (NLP básico)
- Modelo simples prevendo probabilidade de atraso na entrega