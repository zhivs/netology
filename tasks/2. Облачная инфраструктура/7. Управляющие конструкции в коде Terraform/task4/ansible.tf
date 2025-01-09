resource "local_file" "inventory" {
    depends_on = [yandex_compute_instance.webservers, yandex_compute_instance.db, yandex_compute_instance.storage]

    content = templatefile(
    "${path.module}/hosts.tftpl",
    {
        web     =  yandex_compute_instance.webservers
        db      =  yandex_compute_instance.db
        storage =  yandex_compute_instance.storage.*
   }
  )

  filename = "${abspath(path.module)}/hosts.cng"
}