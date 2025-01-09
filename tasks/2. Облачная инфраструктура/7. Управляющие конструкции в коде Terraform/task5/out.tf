output "all_resources" {
  value       = concat(
    [
        for k, v in yandex_compute_instance.webservers: {
            "name": v.name,
            "id"  : v.id,
            "fqdn": v.fqdn
        }
    ],
    [
        for k, v in yandex_compute_instance.db: {
            "name": v.name,
            "id"  : v.id,
            "fqdn": v.fqdn
        }
    ],
    [
        for k, v in yandex_compute_instance.storage.*: {
            "name": v.name,
            "id"  : v.id,
            "fqdn": v.fqdn
        }
    ],
  )
}