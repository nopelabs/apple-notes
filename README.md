# Apple Notes no Hermes Agent

Crie e organize notas formatadas no Apple Notes usando o Hermes, sem controlar a interface do aplicativo. A skill também consulta e pesquisa notas pelo terminal.

## Antes de começar

Você precisa de macOS, Hermes Agent e Homebrew. A sincronização com outros aparelhos depende da configuração do iCloud.

## 1. Instale o memo

No Terminal, execute:

```bash
brew tap antoniorodr/memo
brew install antoniorodr/memo/memo
```

O `memo` é um utilitário de terceiros usado para consultar o Apple Notes.

## 2. Instale a skill

1. Descompacte o ZIP. Dentro dele há uma pasta chamada `apple-notes`, contendo `SKILL.md` e `scripts/`.
2. No Finder, escolha **Ir → Ir para a Pasta** e abra `~/.hermes/skills/`. Se não houver uma pasta chamada `apple`, crie-a e abra-a.
3. Antes de copiar, confira se existe outra skill local chamada `apple-notes` em `skills/` ou em suas categorias. Se houver, mova sua pasta para um backup fora de `skills`, como `~/.hermes/skills-backup/` (crie a pasta de backup se necessário). Se já houver um backup com esse nome, escolha outro para não sobrescrevê-lo.
4. Copie para `~/.hermes/skills/apple/` a pasta `apple-notes` que veio no ZIP.
5. Abra uma nova conversa no Hermes.

Essa instalação é para o perfil padrão. Para um perfil com nome, substitua `~/.hermes/skills/` por `~/.hermes/profiles/NOME-DO-PERFIL/skills/` nos passos 2 e 4; crie e use a subpasta `apple` dentro desse diretório.

**Sobre a versão original:** o Hermes inclui uma skill `apple-notes`. A instalação acima substitui a cópia que estava nesse destino, sem alterar a cópia distribuída no código do Hermes. Na sincronização de skills do `hermes update`, versões locais modificadas são preservadas. Skills locais de mesmo nome em pastas diferentes podem gerar conflito; mantenha apenas uma ativa por perfil. Para restaurar a versão anterior, siga a orientação no final deste guia.

## 3. Autorize o acesso

Ao usar o Apple Notes pela primeira vez, o macOS pode pedir permissão de **Automação**. Autorize o aplicativo que executa o Hermes. Para consultar ou alterar a permissão, abra **Ajustes do Sistema → Privacidade e Segurança → Automação**.

Se não houver pedido, execute no Terminal:

```bash
osascript -e 'tell application "Notes" to count accounts'
```

Esse comando pode autorizar o Terminal; se o Hermes rodar por outro aplicativo, ele poderá pedir uma autorização separada.

## 4. Teste

Em uma nova conversa, peça ao Hermes:

> Crie uma nota de teste no Apple Notes com o título “Teste apple-notes” e um parágrafo de conteúdo.

Informe uma pasta se quiser; caso contrário, o Hermes procura uma pasta existente adequada. Confira a nota no Mac: o título deve começar com `# `, marca de que ela ainda não foi revisada. Depois do teste, você pode apagá-la.

## Se precisar de ajuda

- **Permissão negada:** confira Automação e o aplicativo que está executando o Hermes.
- **`memo: command not found`:** confira a instalação e se o Homebrew está no PATH.
- **Skill não aparece:** confira o caminho do perfil e abra uma nova conversa.
- **Nota não aparece no iPhone:** verifique a sincronização de Notas no iCloud.

Para voltar à versão local anterior, retire a pasta instalada `apple-notes` de `skills` e devolva ao mesmo local o backup que você fez. Se não havia versão local anterior, retire a pasta instalada e verifique qual skill o Hermes carrega em uma nova conversa.

## Sobre os arquivos

`SKILL.md` contém as instruções; `scripts/list-tree.applescript` lista contas, pastas e contagens, sem listar títulos ou conteúdo de notas. Nomes de pastas e contagens também podem ser privados.

O autor usa uma organização inspirada no PARA, com pastas como `___ARQUIVO`, `___ÁREAS`, `___PROJETOS`, `___RECURSOS` e `___REVISAO`. São apenas exemplos; a skill não exige essa estrutura.
