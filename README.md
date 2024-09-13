## Diagrama Entidade-Relacionamento (ER) do Projeto de Implementação SAP

&emsp;&emsp; O diagrama presente na figura abaixo foi criado com base nos dados mestres fornecidos pela G2 Tecnologia, que incluem informações sobre parceiros de negócios, contas bancárias, endereços e informações fiscais. O objetivo deste diagrama é ilustrar a estrutura dos dados mestres e as relações entre as principais entidades envolvidas no processo de implementação do SAP Business One.

<div align="center">
<sub>Figura 1 - Diagrama Entidade Relacionamento</sub>
<img src="DER.png" width="100%" >
<sup>Fonte: Material produzido pelo autor (2024)</sup>
</div>

## Entidades Principais

### 1. **OCRD** (Parceiros de Negócios)
   - **Descrição**: A entidade `OCRD` representa os parceiros de negócios, que podem ser clientes, fornecedores ou leads. Esta tabela contém as principais informações sobre cada parceiro, incluindo nome, tipo de parceiro, contatos e dados adicionais.
   - **Atributos**:
     - `CardCode` (PK): Código único que identifica o parceiro de negócios.
     - `CardName`: Nome completo ou razão social do parceiro.
     - `CardForeignName`: Nome fantasia ou alternativo do parceiro.
     - `CardType`: Define se o parceiro é cliente, fornecedor ou lead.
     - `GroupCode`: Grupo ao qual o parceiro pertence.
     - `Phone1`, `Phone2`: Telefones de contato.
     - `Cellular`: Número de celular do parceiro.
     - `Fax`: Número de fax (se aplicável).
     - `EmailAddress`: Endereço de e-mail do parceiro.
     - `ShippingType`: Tipo de transporte preferido para entrega.
     - `Website`: Site do parceiro de negócios.
     - `CompanyPrivate`: Indica se o parceiro é uma empresa privada ou pública.
   - **Fonte de Dados**: Esta entidade foi mapeada a partir do arquivo `processed_OCRD.xlsx`, que contém os registros de parceiros de negócios, como clientes e fornecedores.

### 2. **CRD1** (Endereços de Parceiros de Negócio)
   - **Descrição**: A entidade `CRD1` armazena os endereços relacionados aos parceiros de negócios cadastrados no sistema. Cada parceiro pode ter múltiplos endereços, como endereços de cobrança ou envio.
   - **Atributos**:
     - `ParentKey` (FK - CardCode): Referência ao código do parceiro de negócios na tabela `OCRD`.
     - `AddressType`: Tipo de endereço (por exemplo, cobrança, envio).
     - `AddressName`: Nome associado ao endereço.
     - `TypeOfAddress`: Tipo de logradouro (rua, avenida, etc.).
     - `Street`: Nome da rua.
     - `StreetNo`: Número do logradouro.
     - `Block`: Bairro do endereço.
     - `City`, `County`: Cidade e região onde o endereço está localizado.
     - `State`: Estado onde o endereço está localizado.
     - `ZipCode`: Código postal (CEP).
     - `Country`: País onde o endereço está localizado.
     - `BuildingFloorRoom`: Informação de sala, andar (se aplicável).
   - **Fonte de Dados**: Os dados desta entidade foram extraídos do arquivo `processed_CRD1.xlsx`, que contém registros de endereços associados a cada parceiro de negócios.

### 3. **CRD7** (Impostos e Identificações)
   - **Descrição**: A entidade `CRD7` contém informações fiscais e tributárias associadas aos parceiros de negócios. Cada parceiro pode ter várias informações fiscais registradas.
   - **Atributos**:
     - `ParentKey` (FK - CardCode): Referência ao código do parceiro de negócios na tabela `OCRD`.
     - `LineNum`: Número da linha para múltiplos registros de impostos.
     - `Address`: Tipo de endereço (COBRANÇA, ENTREGA, etc.).
     - `TaxId0` a `TaxId8`: Números de identificação fiscal do parceiro (CNPJ, CPF, etc.).
   - **Fonte de Dados**: Os dados desta entidade foram extraídos do arquivo `processed_CRD7.xlsx`, que contém informações fiscais associadas aos parceiros de negócios.

### 4. **OCRB** (Contas Bancárias)
   - **Descrição**: A entidade `OCRB` armazena as contas bancárias associadas aos parceiros de negócios. Cada parceiro pode ter uma ou mais contas bancárias registradas no sistema.
   - **Atributos**:
     - `ParentKey` (FK - CardCode): Referência ao código do parceiro de negócios na tabela `OCRD`.
     - `County`: País da conta bancária.
     - `BankCode`: Código do banco da conta bancária.
     - `Branch`: Agência bancária.
     - `AccountNo`: Número da conta bancária.
     - `AccountName`: Nome associado à conta bancária.
   - **Fonte de Dados**: Os dados desta entidade foram extraídos do arquivo `processed_OCRB.xlsx`, que contém informações sobre as contas bancárias dos parceiros de negócios.

## Relacionamentos

### 1. **Relacionamento entre `OCRD` e `CRD1`** (1:N)
   - **Descrição**: Um parceiro de negócios (`OCRD`) pode ter múltiplos endereços (`CRD1`). Isso permite que um cliente ou fornecedor tenha endereços de cobrança e entrega separados.
   - **Implementação**: A chave estrangeira `ParentKey` na entidade `CRD1` referencia a chave primária `CardCode` da entidade `OCRD`, indicando uma relação de um para muitos (1:N).

### 2. **Relacionamento entre `OCRD` e `CRD7`** (1:N)
   - **Descrição**: Um parceiro de negócios (`OCRD`) pode ter várias informações fiscais registradas (`CRD7`). Cada registro de imposto é associado a um único parceiro.
   - **Implementação**: A chave estrangeira `ParentKey` na entidade `CRD7` referencia a chave primária `CardCode` da entidade `OCRD`, representando uma relação de um para muitos (1:N).

### 3. **Relacionamento entre `OCRD` e `OCRB`** (1:N)
   - **Descrição**: Um parceiro de negócios (`OCRD`) pode ter múltiplas contas bancárias registradas (`OCRB`). Isso permite que uma empresa ou indivíduo tenha várias contas associadas.
   - **Implementação**: A chave estrangeira `ParentKey` na entidade `OCRB` referencia a chave primária `CardCode` da entidade `OCRD`, indicando uma relação de um para muitos (1:N).


Este Diagrama Entidade-Relacionamento reflete a organização dos dados mestres essenciais para a implementação do SAP Business One na G2 Tecnologia. Ele ilustra as relações entre os parceiros de negócios e suas respectivas contas bancárias, endereços e informações fiscais, sendo fundamental para garantir a integridade e a eficiência do processo de implementação.