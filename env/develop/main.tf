module "rds-dev" {
    source = "../../infra"

    nome_repositorio = "rds-dev"
    cluster_name = "rds-dev"
}

