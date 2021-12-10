provider "test" {
  region = "somewhere"
}

provider "test" {
  alias  = "backup"
  region = "elsewhere"
}

module "child" {
  source = "./child"
  providers = {
    test        = test
    test.second = test.backup
  }
}
