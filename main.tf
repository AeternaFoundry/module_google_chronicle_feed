resource "google_chronicle_feed" "chronicle_feeds" {
  for_each = var.chronicle_feeds

  instance        = each.value.instance
  location        = each.value.location
  deletion_policy = each.value.deletion_policy
  display_name    = each.value.display_name
  enabled         = each.value.enabled
  feed            = each.value.feed
  project         = each.value.project

  dynamic "details" {
    for_each = each.value.details != null ? [each.value.details] : []
    content {
      dynamic "amazon_kinesis_firehose_settings" {
        for_each = details.value.amazon_kinesis_firehose_settings != null ? [details.value.amazon_kinesis_firehose_settings] : []
        content {
        }
      }
      dynamic "amazon_s3_settings" {
        for_each = details.value.amazon_s3_settings != null ? [details.value.amazon_s3_settings] : []
        content {
          dynamic "authentication" {
            for_each = amazon_s3_settings.value.authentication != null ? [amazon_s3_settings.value.authentication] : []
            content {
              access_key_id     = authentication.value.access_key_id
              client_id         = authentication.value.client_id
              client_secret     = authentication.value.client_secret
              refresh_uri       = authentication.value.refresh_uri
              region            = authentication.value.region
              secret_access_key = authentication.value.secret_access_key
            }
          }
          s3_uri                 = amazon_s3_settings.value.s3_uri
          source_deletion_option = amazon_s3_settings.value.source_deletion_option
          source_type            = amazon_s3_settings.value.source_type
        }
      }
      dynamic "amazon_s3_v2_settings" {
        for_each = details.value.amazon_s3_v2_settings != null ? [details.value.amazon_s3_v2_settings] : []
        content {
          authentication {
            dynamic "access_key_secret_auth" {
              for_each = amazon_s3_v2_settings.value.authentication.access_key_secret_auth != null ? [amazon_s3_v2_settings.value.authentication.access_key_secret_auth] : []
              content {
                access_key_id     = access_key_secret_auth.value.access_key_id
                secret_access_key = access_key_secret_auth.value.secret_access_key
              }
            }
            dynamic "aws_iam_role_auth" {
              for_each = amazon_s3_v2_settings.value.authentication.aws_iam_role_auth != null ? [amazon_s3_v2_settings.value.authentication.aws_iam_role_auth] : []
              content {
                aws_iam_role_arn = aws_iam_role_auth.value.aws_iam_role_arn
                subject_id       = aws_iam_role_auth.value.subject_id
              }
            }
          }
          max_lookback_days      = amazon_s3_v2_settings.value.max_lookback_days
          s3_uri                 = amazon_s3_v2_settings.value.s3_uri
          source_deletion_option = amazon_s3_v2_settings.value.source_deletion_option
        }
      }
      dynamic "amazon_sqs_settings" {
        for_each = details.value.amazon_sqs_settings != null ? [details.value.amazon_sqs_settings] : []
        content {
          account_number = amazon_sqs_settings.value.account_number
          dynamic "authentication" {
            for_each = amazon_sqs_settings.value.authentication != null ? [amazon_sqs_settings.value.authentication] : []
            content {
              dynamic "additional_s3_access_key_secret_auth" {
                for_each = authentication.value.additional_s3_access_key_secret_auth != null ? [authentication.value.additional_s3_access_key_secret_auth] : []
                content {
                  access_key_id     = additional_s3_access_key_secret_auth.value.access_key_id
                  secret_access_key = additional_s3_access_key_secret_auth.value.secret_access_key
                }
              }
              dynamic "sqs_access_key_secret_auth" {
                for_each = authentication.value.sqs_access_key_secret_auth != null ? [authentication.value.sqs_access_key_secret_auth] : []
                content {
                  access_key_id     = sqs_access_key_secret_auth.value.access_key_id
                  secret_access_key = sqs_access_key_secret_auth.value.secret_access_key
                }
              }
            }
          }
          queue                  = amazon_sqs_settings.value.queue
          region                 = amazon_sqs_settings.value.region
          source_deletion_option = amazon_sqs_settings.value.source_deletion_option
        }
      }
      dynamic "amazon_sqs_v2_settings" {
        for_each = details.value.amazon_sqs_v2_settings != null ? [details.value.amazon_sqs_v2_settings] : []
        content {
          authentication {
            aws_iam_role_auth {
              aws_iam_role_arn = amazon_sqs_v2_settings.value.authentication.aws_iam_role_auth.aws_iam_role_arn
              subject_id       = amazon_sqs_v2_settings.value.authentication.aws_iam_role_auth.subject_id
            }
            sqs_v2_access_key_secret_auth {
              access_key_id     = amazon_sqs_v2_settings.value.authentication.sqs_v2_access_key_secret_auth.access_key_id
              secret_access_key = amazon_sqs_v2_settings.value.authentication.sqs_v2_access_key_secret_auth.secret_access_key
            }
          }
          max_lookback_days      = amazon_sqs_v2_settings.value.max_lookback_days
          queue                  = amazon_sqs_v2_settings.value.queue
          s3_uri                 = amazon_sqs_v2_settings.value.s3_uri
          source_deletion_option = amazon_sqs_v2_settings.value.source_deletion_option
        }
      }
      dynamic "anomali_settings" {
        for_each = details.value.anomali_settings != null ? [details.value.anomali_settings] : []
        content {
          dynamic "authentication" {
            for_each = anomali_settings.value.authentication != null ? [anomali_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      asset_namespace = details.value.asset_namespace
      dynamic "aws_ec2_hosts_settings" {
        for_each = details.value.aws_ec2_hosts_settings != null ? [details.value.aws_ec2_hosts_settings] : []
        content {
          dynamic "authentication" {
            for_each = aws_ec2_hosts_settings.value.authentication != null ? [aws_ec2_hosts_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      dynamic "aws_ec2_instances_settings" {
        for_each = details.value.aws_ec2_instances_settings != null ? [details.value.aws_ec2_instances_settings] : []
        content {
          dynamic "authentication" {
            for_each = aws_ec2_instances_settings.value.authentication != null ? [aws_ec2_instances_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      dynamic "aws_ec2_vpcs_settings" {
        for_each = details.value.aws_ec2_vpcs_settings != null ? [details.value.aws_ec2_vpcs_settings] : []
        content {
          dynamic "authentication" {
            for_each = aws_ec2_vpcs_settings.value.authentication != null ? [aws_ec2_vpcs_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      dynamic "aws_iam_settings" {
        for_each = details.value.aws_iam_settings != null ? [details.value.aws_iam_settings] : []
        content {
          api_type = aws_iam_settings.value.api_type
          dynamic "authentication" {
            for_each = aws_iam_settings.value.authentication != null ? [aws_iam_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      dynamic "azure_ad_audit_settings" {
        for_each = details.value.azure_ad_audit_settings != null ? [details.value.azure_ad_audit_settings] : []
        content {
          auth_endpoint = azure_ad_audit_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = azure_ad_audit_settings.value.authentication != null ? [azure_ad_audit_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname  = azure_ad_audit_settings.value.hostname
          tenant_id = azure_ad_audit_settings.value.tenant_id
        }
      }
      dynamic "azure_ad_context_settings" {
        for_each = details.value.azure_ad_context_settings != null ? [details.value.azure_ad_context_settings] : []
        content {
          auth_endpoint = azure_ad_context_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = azure_ad_context_settings.value.authentication != null ? [azure_ad_context_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname         = azure_ad_context_settings.value.hostname
          retrieve_devices = azure_ad_context_settings.value.retrieve_devices
          retrieve_groups  = azure_ad_context_settings.value.retrieve_groups
          tenant_id        = azure_ad_context_settings.value.tenant_id
        }
      }
      dynamic "azure_ad_settings" {
        for_each = details.value.azure_ad_settings != null ? [details.value.azure_ad_settings] : []
        content {
          auth_endpoint = azure_ad_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = azure_ad_settings.value.authentication != null ? [azure_ad_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname  = azure_ad_settings.value.hostname
          tenant_id = azure_ad_settings.value.tenant_id
        }
      }
      dynamic "azure_blob_store_settings" {
        for_each = details.value.azure_blob_store_settings != null ? [details.value.azure_blob_store_settings] : []
        content {
          dynamic "authentication" {
            for_each = azure_blob_store_settings.value.authentication != null ? [azure_blob_store_settings.value.authentication] : []
            content {
              sas_token  = authentication.value.sas_token
              shared_key = authentication.value.shared_key
            }
          }
          azure_uri              = azure_blob_store_settings.value.azure_uri
          source_deletion_option = azure_blob_store_settings.value.source_deletion_option
          source_type            = azure_blob_store_settings.value.source_type
        }
      }
      dynamic "azure_blob_store_v2_settings" {
        for_each = details.value.azure_blob_store_v2_settings != null ? [details.value.azure_blob_store_v2_settings] : []
        content {
          authentication {
            access_key = azure_blob_store_v2_settings.value.authentication.access_key
            azure_v2_workload_identity_federation {
              client_id  = azure_blob_store_v2_settings.value.authentication.azure_v2_workload_identity_federation.client_id
              subject_id = azure_blob_store_v2_settings.value.authentication.azure_v2_workload_identity_federation.subject_id
              tenant_id  = azure_blob_store_v2_settings.value.authentication.azure_v2_workload_identity_federation.tenant_id
            }
            sas_token = azure_blob_store_v2_settings.value.authentication.sas_token
          }
          azure_uri              = azure_blob_store_v2_settings.value.azure_uri
          max_lookback_days      = azure_blob_store_v2_settings.value.max_lookback_days
          source_deletion_option = azure_blob_store_v2_settings.value.source_deletion_option
        }
      }
      dynamic "azure_event_hub_settings" {
        for_each = details.value.azure_event_hub_settings != null ? [details.value.azure_event_hub_settings] : []
        content {
          azure_sas_token                 = azure_event_hub_settings.value.azure_sas_token
          azure_storage_connection_string = azure_event_hub_settings.value.azure_storage_connection_string
          azure_storage_container         = azure_event_hub_settings.value.azure_storage_container
          consumer_group                  = azure_event_hub_settings.value.consumer_group
          event_hub_connection_string     = azure_event_hub_settings.value.event_hub_connection_string
          name                            = azure_event_hub_settings.value.name
        }
      }
      dynamic "azure_mdm_intune_settings" {
        for_each = details.value.azure_mdm_intune_settings != null ? [details.value.azure_mdm_intune_settings] : []
        content {
          auth_endpoint = azure_mdm_intune_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = azure_mdm_intune_settings.value.authentication != null ? [azure_mdm_intune_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname  = azure_mdm_intune_settings.value.hostname
          tenant_id = azure_mdm_intune_settings.value.tenant_id
        }
      }
      dynamic "cloud_passage_settings" {
        for_each = details.value.cloud_passage_settings != null ? [details.value.cloud_passage_settings] : []
        content {
          dynamic "authentication" {
            for_each = cloud_passage_settings.value.authentication != null ? [cloud_passage_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          event_types = cloud_passage_settings.value.event_types
        }
      }
      dynamic "cortex_xdr_settings" {
        for_each = details.value.cortex_xdr_settings != null ? [details.value.cortex_xdr_settings] : []
        content {
          dynamic "authentication" {
            for_each = cortex_xdr_settings.value.authentication != null ? [cortex_xdr_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          endpoint = cortex_xdr_settings.value.endpoint
          hostname = cortex_xdr_settings.value.hostname
        }
      }
      dynamic "crowdstrike_alerts_settings" {
        for_each = details.value.crowdstrike_alerts_settings != null ? [details.value.crowdstrike_alerts_settings] : []
        content {
          authentication {
            client_id      = crowdstrike_alerts_settings.value.authentication.client_id
            client_secret  = crowdstrike_alerts_settings.value.authentication.client_secret
            token_endpoint = crowdstrike_alerts_settings.value.authentication.token_endpoint
          }
          hostname       = crowdstrike_alerts_settings.value.hostname
          ingestion_type = crowdstrike_alerts_settings.value.ingestion_type
        }
      }
      dynamic "crowdstrike_detects_settings" {
        for_each = details.value.crowdstrike_detects_settings != null ? [details.value.crowdstrike_detects_settings] : []
        content {
          dynamic "authentication" {
            for_each = crowdstrike_detects_settings.value.authentication != null ? [crowdstrike_detects_settings.value.authentication] : []
            content {
              client_id      = authentication.value.client_id
              client_secret  = authentication.value.client_secret
              token_endpoint = authentication.value.token_endpoint
            }
          }
          hostname       = crowdstrike_detects_settings.value.hostname
          ingestion_type = crowdstrike_detects_settings.value.ingestion_type
        }
      }
      dynamic "dummy_log_type_settings" {
        for_each = details.value.dummy_log_type_settings != null ? [details.value.dummy_log_type_settings] : []
        content {
          api_endpoint = dummy_log_type_settings.value.api_endpoint
          dynamic "authentication" {
            for_each = dummy_log_type_settings.value.authentication != null ? [dummy_log_type_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
        }
      }
      dynamic "duo_auth_settings" {
        for_each = details.value.duo_auth_settings != null ? [details.value.duo_auth_settings] : []
        content {
          dynamic "authentication" {
            for_each = duo_auth_settings.value.authentication != null ? [duo_auth_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          hostname = duo_auth_settings.value.hostname
        }
      }
      dynamic "duo_user_context_settings" {
        for_each = details.value.duo_user_context_settings != null ? [details.value.duo_user_context_settings] : []
        content {
          dynamic "authentication" {
            for_each = duo_user_context_settings.value.authentication != null ? [duo_user_context_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          hostname = duo_user_context_settings.value.hostname
        }
      }
      feed_source_type = details.value.feed_source_type
      dynamic "fox_it_stix_settings" {
        for_each = details.value.fox_it_stix_settings != null ? [details.value.fox_it_stix_settings] : []
        content {
          dynamic "authentication" {
            for_each = fox_it_stix_settings.value.authentication != null ? [fox_it_stix_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          collection       = fox_it_stix_settings.value.collection
          poll_service_uri = fox_it_stix_settings.value.poll_service_uri
          dynamic "ssl" {
            for_each = fox_it_stix_settings.value.ssl != null ? [fox_it_stix_settings.value.ssl] : []
            content {
              encoded_private_key = ssl.value.encoded_private_key
              ssl_certificate     = ssl.value.ssl_certificate
            }
          }
        }
      }
      dynamic "gcs_settings" {
        for_each = details.value.gcs_settings != null ? [details.value.gcs_settings] : []
        content {
          bucket_uri             = gcs_settings.value.bucket_uri
          source_deletion_option = gcs_settings.value.source_deletion_option
          source_type            = gcs_settings.value.source_type
        }
      }
      dynamic "gcs_v2_settings" {
        for_each = details.value.gcs_v2_settings != null ? [details.value.gcs_v2_settings] : []
        content {
          bucket_uri             = gcs_v2_settings.value.bucket_uri
          max_lookback_days      = gcs_v2_settings.value.max_lookback_days
          source_deletion_option = gcs_v2_settings.value.source_deletion_option
        }
      }
      dynamic "google_cloud_identity_device_users_settings" {
        for_each = details.value.google_cloud_identity_device_users_settings != null ? [details.value.google_cloud_identity_device_users_settings] : []
        content {
          dynamic "authentication" {
            for_each = google_cloud_identity_device_users_settings.value.authentication != null ? [google_cloud_identity_device_users_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
        }
      }
      dynamic "google_cloud_identity_devices_settings" {
        for_each = details.value.google_cloud_identity_devices_settings != null ? [details.value.google_cloud_identity_devices_settings] : []
        content {
          api_version = google_cloud_identity_devices_settings.value.api_version
          dynamic "authentication" {
            for_each = google_cloud_identity_devices_settings.value.authentication != null ? [google_cloud_identity_devices_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
        }
      }
      dynamic "google_cloud_storage_event_driven_settings" {
        for_each = details.value.google_cloud_storage_event_driven_settings != null ? [details.value.google_cloud_storage_event_driven_settings] : []
        content {
          bucket_uri             = google_cloud_storage_event_driven_settings.value.bucket_uri
          max_lookback_days      = google_cloud_storage_event_driven_settings.value.max_lookback_days
          pubsub_subscription    = google_cloud_storage_event_driven_settings.value.pubsub_subscription
          source_deletion_option = google_cloud_storage_event_driven_settings.value.source_deletion_option
        }
      }
      dynamic "http_settings" {
        for_each = details.value.http_settings != null ? [details.value.http_settings] : []
        content {
          source_deletion_option = http_settings.value.source_deletion_option
          source_type            = http_settings.value.source_type
          uri                    = http_settings.value.uri
        }
      }
      dynamic "https_push_amazon_kinesis_firehose_settings" {
        for_each = details.value.https_push_amazon_kinesis_firehose_settings != null ? [details.value.https_push_amazon_kinesis_firehose_settings] : []
        content {
          split_delimiter = https_push_amazon_kinesis_firehose_settings.value.split_delimiter
        }
      }
      dynamic "https_push_google_cloud_pubsub_settings" {
        for_each = details.value.https_push_google_cloud_pubsub_settings != null ? [details.value.https_push_google_cloud_pubsub_settings] : []
        content {
          split_delimiter = https_push_google_cloud_pubsub_settings.value.split_delimiter
        }
      }
      dynamic "https_push_webhook_settings" {
        for_each = details.value.https_push_webhook_settings != null ? [details.value.https_push_webhook_settings] : []
        content {
          split_delimiter = https_push_webhook_settings.value.split_delimiter
        }
      }
      dynamic "imperva_waf_settings" {
        for_each = details.value.imperva_waf_settings != null ? [details.value.imperva_waf_settings] : []
        content {
          dynamic "authentication" {
            for_each = imperva_waf_settings.value.authentication != null ? [imperva_waf_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
        }
      }
      labels   = details.value.labels
      log_type = details.value.log_type
      dynamic "mandiant_ioc_settings" {
        for_each = details.value.mandiant_ioc_settings != null ? [details.value.mandiant_ioc_settings] : []
        content {
          dynamic "authentication" {
            for_each = mandiant_ioc_settings.value.authentication != null ? [mandiant_ioc_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          start_time = mandiant_ioc_settings.value.start_time
        }
      }
      dynamic "microsoft_graph_alert_settings" {
        for_each = details.value.microsoft_graph_alert_settings != null ? [details.value.microsoft_graph_alert_settings] : []
        content {
          auth_endpoint = microsoft_graph_alert_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = microsoft_graph_alert_settings.value.authentication != null ? [microsoft_graph_alert_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname  = microsoft_graph_alert_settings.value.hostname
          tenant_id = microsoft_graph_alert_settings.value.tenant_id
        }
      }
      dynamic "microsoft_security_center_alert_settings" {
        for_each = details.value.microsoft_security_center_alert_settings != null ? [details.value.microsoft_security_center_alert_settings] : []
        content {
          auth_endpoint = microsoft_security_center_alert_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = microsoft_security_center_alert_settings.value.authentication != null ? [microsoft_security_center_alert_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          hostname        = microsoft_security_center_alert_settings.value.hostname
          subscription_id = microsoft_security_center_alert_settings.value.subscription_id
          tenant_id       = microsoft_security_center_alert_settings.value.tenant_id
        }
      }
      dynamic "mimecast_mail_settings" {
        for_each = details.value.mimecast_mail_settings != null ? [details.value.mimecast_mail_settings] : []
        content {
          dynamic "authentication" {
            for_each = mimecast_mail_settings.value.authentication != null ? [mimecast_mail_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          hostname = mimecast_mail_settings.value.hostname
        }
      }
      dynamic "mimecast_mail_v2_settings" {
        for_each = details.value.mimecast_mail_v2_settings != null ? [details.value.mimecast_mail_v2_settings] : []
        content {
          dynamic "auth_credentials" {
            for_each = mimecast_mail_v2_settings.value.auth_credentials != null ? [mimecast_mail_v2_settings.value.auth_credentials] : []
            content {
              client_id     = auth_credentials.value.client_id
              client_secret = auth_credentials.value.client_secret
            }
          }
        }
      }
      dynamic "netskope_alert_settings" {
        for_each = details.value.netskope_alert_settings != null ? [details.value.netskope_alert_settings] : []
        content {
          dynamic "authentication" {
            for_each = netskope_alert_settings.value.authentication != null ? [netskope_alert_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          content_type = netskope_alert_settings.value.content_type
          feedname     = netskope_alert_settings.value.feedname
          hostname     = netskope_alert_settings.value.hostname
        }
      }
      dynamic "netskope_alert_v2_settings" {
        for_each = details.value.netskope_alert_v2_settings != null ? [details.value.netskope_alert_v2_settings] : []
        content {
          dynamic "authentication" {
            for_each = netskope_alert_v2_settings.value.authentication != null ? [netskope_alert_v2_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          content_category = netskope_alert_v2_settings.value.content_category
          content_types    = netskope_alert_v2_settings.value.content_types
          hostname         = netskope_alert_v2_settings.value.hostname
        }
      }
      dynamic "office365_settings" {
        for_each = details.value.office365_settings != null ? [details.value.office365_settings] : []
        content {
          auth_endpoint = office365_settings.value.auth_endpoint
          dynamic "authentication" {
            for_each = office365_settings.value.authentication != null ? [office365_settings.value.authentication] : []
            content {
              client_id     = authentication.value.client_id
              client_secret = authentication.value.client_secret
            }
          }
          content_type = office365_settings.value.content_type
          hostname     = office365_settings.value.hostname
          tenant_id    = office365_settings.value.tenant_id
        }
      }
      dynamic "okta_settings" {
        for_each = details.value.okta_settings != null ? [details.value.okta_settings] : []
        content {
          dynamic "authentication" {
            for_each = okta_settings.value.authentication != null ? [okta_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          hostname = okta_settings.value.hostname
        }
      }
      dynamic "okta_user_context_settings" {
        for_each = details.value.okta_user_context_settings != null ? [details.value.okta_user_context_settings] : []
        content {
          dynamic "authentication" {
            for_each = okta_user_context_settings.value.authentication != null ? [okta_user_context_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          hostname                   = okta_user_context_settings.value.hostname
          manager_id_reference_field = okta_user_context_settings.value.manager_id_reference_field
        }
      }
      dynamic "pan_ioc_settings" {
        for_each = details.value.pan_ioc_settings != null ? [details.value.pan_ioc_settings] : []
        content {
          dynamic "authentication" {
            for_each = pan_ioc_settings.value.authentication != null ? [pan_ioc_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          feed    = pan_ioc_settings.value.feed
          feed_id = pan_ioc_settings.value.feed_id
        }
      }
      dynamic "pan_prisma_cloud_settings" {
        for_each = details.value.pan_prisma_cloud_settings != null ? [details.value.pan_prisma_cloud_settings] : []
        content {
          dynamic "authentication" {
            for_each = pan_prisma_cloud_settings.value.authentication != null ? [pan_prisma_cloud_settings.value.authentication] : []
            content {
              password = authentication.value.password
              user     = authentication.value.user
            }
          }
          hostname = pan_prisma_cloud_settings.value.hostname
        }
      }
      dynamic "proofpoint_mail_settings" {
        for_each = details.value.proofpoint_mail_settings != null ? [details.value.proofpoint_mail_settings] : []
        content {
          dynamic "authentication" {
            for_each = proofpoint_mail_settings.value.authentication != null ? [proofpoint_mail_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
        }
      }
      dynamic "proofpoint_on_demand_settings" {
        for_each = details.value.proofpoint_on_demand_settings != null ? [details.value.proofpoint_on_demand_settings] : []
        content {
          dynamic "authentication" {
            for_each = proofpoint_on_demand_settings.value.authentication != null ? [proofpoint_on_demand_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          cluster_id = proofpoint_on_demand_settings.value.cluster_id
        }
      }
      dynamic "pubsub_settings" {
        for_each = details.value.pubsub_settings != null ? [details.value.pubsub_settings] : []
        content {
          google_service_account_email = pubsub_settings.value.google_service_account_email
        }
      }
      dynamic "qualys_scan_settings" {
        for_each = details.value.qualys_scan_settings != null ? [details.value.qualys_scan_settings] : []
        content {
          api_type = qualys_scan_settings.value.api_type
          dynamic "authentication" {
            for_each = qualys_scan_settings.value.authentication != null ? [qualys_scan_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          hostname = qualys_scan_settings.value.hostname
        }
      }
      dynamic "qualys_vm_settings" {
        for_each = details.value.qualys_vm_settings != null ? [details.value.qualys_vm_settings] : []
        content {
          dynamic "authentication" {
            for_each = qualys_vm_settings.value.authentication != null ? [qualys_vm_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          hostname = qualys_vm_settings.value.hostname
        }
      }
      dynamic "rapid7_insight_settings" {
        for_each = details.value.rapid7_insight_settings != null ? [details.value.rapid7_insight_settings] : []
        content {
          dynamic "authentication" {
            for_each = rapid7_insight_settings.value.authentication != null ? [rapid7_insight_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          endpoint = rapid7_insight_settings.value.endpoint
          hostname = rapid7_insight_settings.value.hostname
        }
      }
      dynamic "recorded_future_ioc_settings" {
        for_each = details.value.recorded_future_ioc_settings != null ? [details.value.recorded_future_ioc_settings] : []
        content {
          dynamic "authentication" {
            for_each = recorded_future_ioc_settings.value.authentication != null ? [recorded_future_ioc_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
        }
      }
      dynamic "rh_isac_ioc_settings" {
        for_each = details.value.rh_isac_ioc_settings != null ? [details.value.rh_isac_ioc_settings] : []
        content {
          dynamic "authentication" {
            for_each = rh_isac_ioc_settings.value.authentication != null ? [rh_isac_ioc_settings.value.authentication] : []
            content {
              client_id      = authentication.value.client_id
              client_secret  = authentication.value.client_secret
              token_endpoint = authentication.value.token_endpoint
            }
          }
        }
      }
      dynamic "salesforce_settings" {
        for_each = details.value.salesforce_settings != null ? [details.value.salesforce_settings] : []
        content {
          hostname = salesforce_settings.value.hostname
          dynamic "oauth_jwt_credentials" {
            for_each = salesforce_settings.value.oauth_jwt_credentials != null ? [salesforce_settings.value.oauth_jwt_credentials] : []
            content {
              dynamic "claims" {
                for_each = oauth_jwt_credentials.value.claims != null ? [oauth_jwt_credentials.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = oauth_jwt_credentials.value.rs_credentials != null ? [oauth_jwt_credentials.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = oauth_jwt_credentials.value.token_endpoint
            }
          }
          dynamic "oauth_password_grant_auth" {
            for_each = salesforce_settings.value.oauth_password_grant_auth != null ? [salesforce_settings.value.oauth_password_grant_auth] : []
            content {
              client_id      = oauth_password_grant_auth.value.client_id
              client_secret  = oauth_password_grant_auth.value.client_secret
              password       = oauth_password_grant_auth.value.password
              token_endpoint = oauth_password_grant_auth.value.token_endpoint
              user           = oauth_password_grant_auth.value.user
            }
          }
        }
      }
      dynamic "sentinelone_alert_settings" {
        for_each = details.value.sentinelone_alert_settings != null ? [details.value.sentinelone_alert_settings] : []
        content {
          dynamic "authentication" {
            for_each = sentinelone_alert_settings.value.authentication != null ? [sentinelone_alert_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          hostname                = sentinelone_alert_settings.value.hostname
          initial_start_time      = sentinelone_alert_settings.value.initial_start_time
          is_alert_api_subscribed = sentinelone_alert_settings.value.is_alert_api_subscribed
        }
      }
      dynamic "service_now_cmdb_settings" {
        for_each = details.value.service_now_cmdb_settings != null ? [details.value.service_now_cmdb_settings] : []
        content {
          dynamic "authentication" {
            for_each = service_now_cmdb_settings.value.authentication != null ? [service_now_cmdb_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          feedname = service_now_cmdb_settings.value.feedname
          hostname = service_now_cmdb_settings.value.hostname
        }
      }
      dynamic "sftp_settings" {
        for_each = details.value.sftp_settings != null ? [details.value.sftp_settings] : []
        content {
          dynamic "authentication" {
            for_each = sftp_settings.value.authentication != null ? [sftp_settings.value.authentication] : []
            content {
              password               = authentication.value.password
              private_key            = authentication.value.private_key
              private_key_passphrase = authentication.value.private_key_passphrase
              username               = authentication.value.username
            }
          }
          source_deletion_option = sftp_settings.value.source_deletion_option
          source_type            = sftp_settings.value.source_type
          uri                    = sftp_settings.value.uri
        }
      }
      dynamic "symantec_event_export_settings" {
        for_each = details.value.symantec_event_export_settings != null ? [details.value.symantec_event_export_settings] : []
        content {
          dynamic "authentication" {
            for_each = symantec_event_export_settings.value.authentication != null ? [symantec_event_export_settings.value.authentication] : []
            content {
              client_id      = authentication.value.client_id
              client_secret  = authentication.value.client_secret
              refresh_token  = authentication.value.refresh_token
              token_endpoint = authentication.value.token_endpoint
            }
          }
        }
      }
      dynamic "thinkst_canary_settings" {
        for_each = details.value.thinkst_canary_settings != null ? [details.value.thinkst_canary_settings] : []
        content {
          dynamic "authentication" {
            for_each = thinkst_canary_settings.value.authentication != null ? [thinkst_canary_settings.value.authentication] : []
            content {
              dynamic "header_key_values" {
                for_each = authentication.value.header_key_values != null ? authentication.value.header_key_values : []
                content {
                  key   = header_key_values.value.key
                  value = header_key_values.value.value
                }
              }
            }
          }
          hostname = thinkst_canary_settings.value.hostname
        }
      }
      dynamic "threat_connect_ioc_settings" {
        for_each = details.value.threat_connect_ioc_settings != null ? [details.value.threat_connect_ioc_settings] : []
        content {
          dynamic "authentication" {
            for_each = threat_connect_ioc_settings.value.authentication != null ? [threat_connect_ioc_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          hostname = threat_connect_ioc_settings.value.hostname
          owners   = threat_connect_ioc_settings.value.owners
        }
      }
      dynamic "threat_connect_ioc_v3_settings" {
        for_each = details.value.threat_connect_ioc_v3_settings != null ? [details.value.threat_connect_ioc_v3_settings] : []
        content {
          dynamic "authentication" {
            for_each = threat_connect_ioc_v3_settings.value.authentication != null ? [threat_connect_ioc_v3_settings.value.authentication] : []
            content {
              secret = authentication.value.secret
              user   = authentication.value.user
            }
          }
          fields    = threat_connect_ioc_v3_settings.value.fields
          hostname  = threat_connect_ioc_v3_settings.value.hostname
          owners    = threat_connect_ioc_v3_settings.value.owners
          schedule  = threat_connect_ioc_v3_settings.value.schedule
          tql_query = threat_connect_ioc_v3_settings.value.tql_query
        }
      }
      dynamic "trellix_hx_alerts_settings" {
        for_each = details.value.trellix_hx_alerts_settings != null ? [details.value.trellix_hx_alerts_settings] : []
        content {
          dynamic "authentication" {
            for_each = trellix_hx_alerts_settings.value.authentication != null ? [trellix_hx_alerts_settings.value.authentication] : []
            content {
              dynamic "msso" {
                for_each = authentication.value.msso != null ? [authentication.value.msso] : []
                content {
                  api_endpoint = msso.value.api_endpoint
                  password     = msso.value.password
                  username     = msso.value.username
                }
              }
              dynamic "trellix_iam" {
                for_each = authentication.value.trellix_iam != null ? [authentication.value.trellix_iam] : []
                content {
                  client_id     = trellix_iam.value.client_id
                  client_secret = trellix_iam.value.client_secret
                  scope         = trellix_iam.value.scope
                }
              }
            }
          }
          endpoint = trellix_hx_alerts_settings.value.endpoint
        }
      }
      dynamic "trellix_hx_bulk_acqs_settings" {
        for_each = details.value.trellix_hx_bulk_acqs_settings != null ? [details.value.trellix_hx_bulk_acqs_settings] : []
        content {
          dynamic "authentication" {
            for_each = trellix_hx_bulk_acqs_settings.value.authentication != null ? [trellix_hx_bulk_acqs_settings.value.authentication] : []
            content {
              dynamic "msso" {
                for_each = authentication.value.msso != null ? [authentication.value.msso] : []
                content {
                  api_endpoint = msso.value.api_endpoint
                  password     = msso.value.password
                  username     = msso.value.username
                }
              }
              dynamic "trellix_iam" {
                for_each = authentication.value.trellix_iam != null ? [authentication.value.trellix_iam] : []
                content {
                  client_id     = trellix_iam.value.client_id
                  client_secret = trellix_iam.value.client_secret
                  scope         = trellix_iam.value.scope
                }
              }
            }
          }
          endpoint = trellix_hx_bulk_acqs_settings.value.endpoint
        }
      }
      dynamic "trellix_hx_hosts_settings" {
        for_each = details.value.trellix_hx_hosts_settings != null ? [details.value.trellix_hx_hosts_settings] : []
        content {
          dynamic "authentication" {
            for_each = trellix_hx_hosts_settings.value.authentication != null ? [trellix_hx_hosts_settings.value.authentication] : []
            content {
              dynamic "msso" {
                for_each = authentication.value.msso != null ? [authentication.value.msso] : []
                content {
                  api_endpoint = msso.value.api_endpoint
                  password     = msso.value.password
                  username     = msso.value.username
                }
              }
              dynamic "trellix_iam" {
                for_each = authentication.value.trellix_iam != null ? [authentication.value.trellix_iam] : []
                content {
                  client_id     = trellix_iam.value.client_id
                  client_secret = trellix_iam.value.client_secret
                  scope         = trellix_iam.value.scope
                }
              }
            }
          }
          endpoint = trellix_hx_hosts_settings.value.endpoint
        }
      }
      dynamic "webhook_settings" {
        for_each = details.value.webhook_settings != null ? [details.value.webhook_settings] : []
        content {
        }
      }
      dynamic "workday_settings" {
        for_each = details.value.workday_settings != null ? [details.value.workday_settings] : []
        content {
          dynamic "authentication" {
            for_each = workday_settings.value.authentication != null ? [workday_settings.value.authentication] : []
            content {
              client_id      = authentication.value.client_id
              client_secret  = authentication.value.client_secret
              refresh_token  = authentication.value.refresh_token
              secret         = authentication.value.secret
              token_endpoint = authentication.value.token_endpoint
              user           = authentication.value.user
            }
          }
          hostname  = workday_settings.value.hostname
          tenant_id = workday_settings.value.tenant_id
        }
      }
      dynamic "workspace_activity_settings" {
        for_each = details.value.workspace_activity_settings != null ? [details.value.workspace_activity_settings] : []
        content {
          applications = workspace_activity_settings.value.applications
          dynamic "authentication" {
            for_each = workspace_activity_settings.value.authentication != null ? [workspace_activity_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_activity_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_alerts_settings" {
        for_each = details.value.workspace_alerts_settings != null ? [details.value.workspace_alerts_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_alerts_settings.value.authentication != null ? [workspace_alerts_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_alerts_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_chrome_os_settings" {
        for_each = details.value.workspace_chrome_os_settings != null ? [details.value.workspace_chrome_os_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_chrome_os_settings.value.authentication != null ? [workspace_chrome_os_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_chrome_os_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_groups_settings" {
        for_each = details.value.workspace_groups_settings != null ? [details.value.workspace_groups_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_groups_settings.value.authentication != null ? [workspace_groups_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_groups_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_mobile_settings" {
        for_each = details.value.workspace_mobile_settings != null ? [details.value.workspace_mobile_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_mobile_settings.value.authentication != null ? [workspace_mobile_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_mobile_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_privileges_settings" {
        for_each = details.value.workspace_privileges_settings != null ? [details.value.workspace_privileges_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_privileges_settings.value.authentication != null ? [workspace_privileges_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          workspace_customer_id = workspace_privileges_settings.value.workspace_customer_id
        }
      }
      dynamic "workspace_users_settings" {
        for_each = details.value.workspace_users_settings != null ? [details.value.workspace_users_settings] : []
        content {
          dynamic "authentication" {
            for_each = workspace_users_settings.value.authentication != null ? [workspace_users_settings.value.authentication] : []
            content {
              dynamic "claims" {
                for_each = authentication.value.claims != null ? [authentication.value.claims] : []
                content {
                  audience = claims.value.audience
                  issuer   = claims.value.issuer
                  subject  = claims.value.subject
                }
              }
              dynamic "rs_credentials" {
                for_each = authentication.value.rs_credentials != null ? [authentication.value.rs_credentials] : []
                content {
                  private_key = rs_credentials.value.private_key
                }
              }
              token_endpoint = authentication.value.token_endpoint
            }
          }
          projection_type       = workspace_users_settings.value.projection_type
          workspace_customer_id = workspace_users_settings.value.workspace_customer_id
        }
      }
    }
  }

  dynamic "failure_details" {
    for_each = each.value.failure_details != null ? [each.value.failure_details] : []
    content {
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

