resource "aws_msk_cluster" "this" {
  cluster_name           = "348-msk-cluster-red"
  kafka_version          = "2.6.2"
  number_of_broker_nodes = 3

  encryption_info {
      encryption_in_transit {
          client_broker = "TLS_PLAINTEXT"
          in_cluster = true
      }
  }
  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = [
      aws_subnet.subnet_1.id,
      aws_subnet.subnet_2.id,
      aws_subnet.subnet_3.id,
    ]
    storage_info {
      ebs_storage_info {
        volume_size = 5
      }
    }
    security_groups = [aws_security_group.this.id]
  }
}