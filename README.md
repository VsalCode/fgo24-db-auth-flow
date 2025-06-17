## ERD Authflow

```mermaid
  erDiagram
  direction LR
  user ||--o{ login: "melakukan"
  user ||--o{ register: "melakukan"
  user {
    string id_user PK
    string fullname_user
    string email_user
    string password_user
    string confirm_password_user
  }
  login {
    string id_login PK
    string token_login
    boolean status_login
    string id_user FK
    string id_register FK
  }
  register ||--|| login : "diarahkan"
  register {
    string id_register PK
    boolean status_register
    string id_user FK
  }
  login ||--|| account : menampilkan
  account {
    string id_account PK
    string id_register FK
    string id_login FK
  }

```

<!-- ```mermaid
  erDiagram
  direction LR
  account {
    string id_account PK
    string id_login FK
    string id_register FK
  }
  login {
    string id_login PK
    string username
    string email
    string password
    string id_register FK
  }
  register {
    string id_register PK
    string name
    int age
  }
``` -->