variable "chronicle_feeds" {
  description = <<EOT
Map of chronicle_feeds, attributes below
Required:
    - instance
    - location
Optional:
    - deletion_policy
    - display_name
    - enabled
    - feed
    - project
    - details (block):
        - amazon_kinesis_firehose_settings (optional, block):
        - amazon_s3_settings (optional, block):
            - authentication (optional, block):
                - access_key_id (optional)
                - client_id (optional)
                - client_secret (optional)
                - refresh_uri (optional)
                - region (required)
                - secret_access_key (optional)
            - s3_uri (required)
            - source_deletion_option (required)
            - source_type (required)
        - amazon_s3_v2_settings (optional, block):
            - authentication (required, block):
                - access_key_secret_auth (optional, block):
                    - access_key_id (required)
                    - secret_access_key (required)
                - aws_iam_role_auth (optional, block):
                    - aws_iam_role_arn (optional)
                    - subject_id (optional)
            - max_lookback_days (optional)
            - s3_uri (required)
            - source_deletion_option (optional)
        - amazon_sqs_settings (optional, block):
            - account_number (optional)
            - authentication (optional, block):
                - additional_s3_access_key_secret_auth (optional, block):
                    - access_key_id (optional)
                    - secret_access_key (optional)
                - sqs_access_key_secret_auth (optional, block):
                    - access_key_id (optional)
                    - secret_access_key (optional)
            - queue (optional)
            - region (optional)
            - source_deletion_option (optional)
        - amazon_sqs_v2_settings (optional, block):
            - authentication (required, block):
                - aws_iam_role_auth (required, block):
                    - aws_iam_role_arn (optional)
                    - subject_id (optional)
                - sqs_v2_access_key_secret_auth (required, block):
                    - access_key_id (optional)
                    - secret_access_key (optional)
            - max_lookback_days (optional)
            - queue (required)
            - s3_uri (required)
            - source_deletion_option (optional)
        - anomali_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - asset_namespace (optional)
        - aws_ec2_hosts_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - aws_ec2_instances_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - aws_ec2_vpcs_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - aws_iam_settings (optional, block):
            - api_type (optional)
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - azure_ad_audit_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - tenant_id (optional)
        - azure_ad_context_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - retrieve_devices (optional)
            - retrieve_groups (optional)
            - tenant_id (optional)
        - azure_ad_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - tenant_id (optional)
        - azure_blob_store_settings (optional, block):
            - authentication (optional, block):
                - sas_token (optional)
                - shared_key (optional)
            - azure_uri (optional)
            - source_deletion_option (optional)
            - source_type (optional)
        - azure_blob_store_v2_settings (optional, block):
            - authentication (required, block):
                - access_key (required)
                - azure_v2_workload_identity_federation (required, block):
                    - client_id (required)
                    - subject_id (required)
                    - tenant_id (required)
                - sas_token (required)
            - azure_uri (required)
            - max_lookback_days (optional)
            - source_deletion_option (optional)
        - azure_event_hub_settings (optional, block):
            - azure_sas_token (optional)
            - azure_storage_connection_string (optional)
            - azure_storage_container (optional)
            - consumer_group (required)
            - event_hub_connection_string (required)
            - name (required)
        - azure_mdm_intune_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - tenant_id (optional)
        - cloud_passage_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - event_types (optional)
        - cortex_xdr_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - endpoint (optional)
            - hostname (optional)
        - crowdstrike_alerts_settings (optional, block):
            - authentication (required, block):
                - client_id (optional)
                - client_secret (optional)
                - token_endpoint (optional)
            - hostname (required)
            - ingestion_type (optional)
        - crowdstrike_detects_settings (optional, block):
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
                - token_endpoint (optional)
            - hostname (optional)
            - ingestion_type (optional)
        - dummy_log_type_settings (optional, block):
            - api_endpoint (optional)
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
        - duo_auth_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - hostname (optional)
        - duo_user_context_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - hostname (optional)
        - feed_source_type (optional)
        - fox_it_stix_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - collection (optional)
            - poll_service_uri (optional)
            - ssl (optional, block):
                - encoded_private_key (optional)
                - ssl_certificate (optional)
        - gcs_settings (optional, block):
            - bucket_uri (optional)
            - source_deletion_option (optional)
            - source_type (optional)
        - gcs_v2_settings (optional, block):
            - bucket_uri (required)
            - max_lookback_days (optional)
            - source_deletion_option (optional)
        - google_cloud_identity_device_users_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
        - google_cloud_identity_devices_settings (optional, block):
            - api_version (optional)
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
        - google_cloud_storage_event_driven_settings (optional, block):
            - bucket_uri (required)
            - max_lookback_days (optional)
            - pubsub_subscription (required)
            - source_deletion_option (optional)
        - http_settings (optional, block):
            - source_deletion_option (optional)
            - source_type (optional)
            - uri (optional)
        - https_push_amazon_kinesis_firehose_settings (optional, block):
            - split_delimiter (optional)
        - https_push_google_cloud_pubsub_settings (optional, block):
            - split_delimiter (optional)
        - https_push_webhook_settings (optional, block):
            - split_delimiter (optional)
        - imperva_waf_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
        - labels (optional)
        - log_type (required)
        - mandiant_ioc_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - start_time (optional)
        - microsoft_graph_alert_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - tenant_id (optional)
        - microsoft_security_center_alert_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - hostname (optional)
            - subscription_id (optional)
            - tenant_id (optional)
        - mimecast_mail_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - hostname (optional)
        - mimecast_mail_v2_settings (optional, block):
            - auth_credentials (optional, block):
                - client_id (optional)
                - client_secret (optional)
        - netskope_alert_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - content_type (optional)
            - feedname (optional)
            - hostname (optional)
        - netskope_alert_v2_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - content_category (optional)
            - content_types (optional)
            - hostname (optional)
        - office365_settings (optional, block):
            - auth_endpoint (optional)
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - content_type (optional)
            - hostname (optional)
            - tenant_id (optional)
        - okta_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - hostname (optional)
        - okta_user_context_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - hostname (optional)
            - manager_id_reference_field (optional)
        - pan_ioc_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - feed (optional)
            - feed_id (optional)
        - pan_prisma_cloud_settings (optional, block):
            - authentication (optional, block):
                - password (optional)
                - user (optional)
            - hostname (optional)
        - proofpoint_mail_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
        - proofpoint_on_demand_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - cluster_id (optional)
        - pubsub_settings (optional, block):
            - google_service_account_email (optional)
        - qualys_scan_settings (optional, block):
            - api_type (optional)
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - hostname (optional)
        - qualys_vm_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - hostname (optional)
        - rapid7_insight_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - endpoint (optional)
            - hostname (optional)
        - recorded_future_ioc_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
        - rh_isac_ioc_settings (optional, block):
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
                - token_endpoint (optional)
        - salesforce_settings (optional, block):
            - hostname (optional)
            - oauth_jwt_credentials (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - oauth_password_grant_auth (optional, block):
                - client_id (optional)
                - client_secret (optional)
                - password (optional)
                - token_endpoint (optional)
                - user (optional)
        - sentinelone_alert_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - hostname (optional)
            - initial_start_time (optional)
            - is_alert_api_subscribed (optional)
        - service_now_cmdb_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - feedname (optional)
            - hostname (optional)
        - sftp_settings (optional, block):
            - authentication (optional, block):
                - password (optional)
                - private_key (optional)
                - private_key_passphrase (optional)
                - username (optional)
            - source_deletion_option (optional)
            - source_type (optional)
            - uri (optional)
        - symantec_event_export_settings (optional, block):
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
                - refresh_token (optional)
                - token_endpoint (optional)
        - thinkst_canary_settings (optional, block):
            - authentication (optional, block):
                - header_key_values (optional, block):
                    - key (optional)
                    - value (optional)
            - hostname (optional)
        - threat_connect_ioc_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - hostname (optional)
            - owners (optional)
        - threat_connect_ioc_v3_settings (optional, block):
            - authentication (optional, block):
                - secret (optional)
                - user (optional)
            - fields (optional)
            - hostname (optional)
            - owners (optional)
            - schedule (optional)
            - tql_query (optional)
        - trellix_hx_alerts_settings (optional, block):
            - authentication (optional, block):
                - msso (optional, block):
                    - api_endpoint (optional)
                    - password (optional)
                    - username (optional)
                - trellix_iam (optional, block):
                    - client_id (optional)
                    - client_secret (optional)
                    - scope (optional)
            - endpoint (optional)
        - trellix_hx_bulk_acqs_settings (optional, block):
            - authentication (optional, block):
                - msso (optional, block):
                    - api_endpoint (required)
                    - password (required)
                    - username (required)
                - trellix_iam (optional, block):
                    - client_id (required)
                    - client_secret (required)
                    - scope (required)
            - endpoint (required)
        - trellix_hx_hosts_settings (optional, block):
            - authentication (optional, block):
                - msso (optional, block):
                    - api_endpoint (required)
                    - password (required)
                    - username (required)
                - trellix_iam (optional, block):
                    - client_id (required)
                    - client_secret (required)
                    - scope (required)
            - endpoint (required)
        - webhook_settings (optional, block):
        - workday_settings (optional, block):
            - authentication (optional, block):
                - client_id (optional)
                - client_secret (optional)
                - refresh_token (optional)
                - secret (optional)
                - token_endpoint (optional)
                - user (optional)
            - hostname (optional)
            - tenant_id (optional)
        - workspace_activity_settings (optional, block):
            - applications (optional)
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_alerts_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_chrome_os_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_groups_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_mobile_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_privileges_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - workspace_customer_id (optional)
        - workspace_users_settings (optional, block):
            - authentication (optional, block):
                - claims (optional, block):
                    - audience (optional)
                    - issuer (optional)
                    - subject (optional)
                - rs_credentials (optional, block):
                    - private_key (optional)
                - token_endpoint (optional)
            - projection_type (optional)
            - workspace_customer_id (optional)
    - failure_details (block):
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    instance        = string
    location        = string
    deletion_policy = optional(string)
    display_name    = optional(string)
    enabled         = optional(bool)
    feed            = optional(string)
    project         = optional(string)
    details = optional(object({
      amazon_kinesis_firehose_settings = optional(object({
      }))
      amazon_s3_settings = optional(object({
        authentication = optional(object({
          access_key_id     = optional(string)
          client_id         = optional(string)
          client_secret     = optional(string)
          refresh_uri       = optional(string)
          region            = string
          secret_access_key = optional(string)
        }))
        s3_uri                 = string
        source_deletion_option = string
        source_type            = string
      }))
      amazon_s3_v2_settings = optional(object({
        authentication = object({
          access_key_secret_auth = optional(object({
            access_key_id     = string
            secret_access_key = string
          }))
          aws_iam_role_auth = optional(object({
            aws_iam_role_arn = optional(string)
            subject_id       = optional(string)
          }))
        })
        max_lookback_days      = optional(number)
        s3_uri                 = string
        source_deletion_option = optional(string)
      }))
      amazon_sqs_settings = optional(object({
        account_number = optional(string)
        authentication = optional(object({
          additional_s3_access_key_secret_auth = optional(object({
            access_key_id     = optional(string)
            secret_access_key = optional(string)
          }))
          sqs_access_key_secret_auth = optional(object({
            access_key_id     = optional(string)
            secret_access_key = optional(string)
          }))
        }))
        queue                  = optional(string)
        region                 = optional(string)
        source_deletion_option = optional(string)
      }))
      amazon_sqs_v2_settings = optional(object({
        authentication = object({
          aws_iam_role_auth = object({
            aws_iam_role_arn = optional(string)
            subject_id       = optional(string)
          })
          sqs_v2_access_key_secret_auth = object({
            access_key_id     = optional(string)
            secret_access_key = optional(string)
          })
        })
        max_lookback_days      = optional(number)
        queue                  = string
        s3_uri                 = string
        source_deletion_option = optional(string)
      }))
      anomali_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      asset_namespace = optional(string)
      aws_ec2_hosts_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      aws_ec2_instances_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      aws_ec2_vpcs_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      aws_iam_settings = optional(object({
        api_type = optional(string)
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      azure_ad_audit_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname  = optional(string)
        tenant_id = optional(string)
      }))
      azure_ad_context_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname         = optional(string)
        retrieve_devices = optional(bool)
        retrieve_groups  = optional(bool)
        tenant_id        = optional(string)
      }))
      azure_ad_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname  = optional(string)
        tenant_id = optional(string)
      }))
      azure_blob_store_settings = optional(object({
        authentication = optional(object({
          sas_token  = optional(string)
          shared_key = optional(string)
        }))
        azure_uri              = optional(string)
        source_deletion_option = optional(string)
        source_type            = optional(string)
      }))
      azure_blob_store_v2_settings = optional(object({
        authentication = object({
          access_key = string
          azure_v2_workload_identity_federation = object({
            client_id  = string
            subject_id = string
            tenant_id  = string
          })
          sas_token = string
        })
        azure_uri              = string
        max_lookback_days      = optional(number)
        source_deletion_option = optional(string)
      }))
      azure_event_hub_settings = optional(object({
        azure_sas_token                 = optional(string)
        azure_storage_connection_string = optional(string)
        azure_storage_container         = optional(string)
        consumer_group                  = string
        event_hub_connection_string     = string
        name                            = string
      }))
      azure_mdm_intune_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname  = optional(string)
        tenant_id = optional(string)
      }))
      cloud_passage_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        event_types = optional(list(string))
      }))
      cortex_xdr_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        endpoint = optional(string)
        hostname = optional(string)
      }))
      crowdstrike_alerts_settings = optional(object({
        authentication = object({
          client_id      = optional(string)
          client_secret  = optional(string)
          token_endpoint = optional(string)
        })
        hostname       = string
        ingestion_type = optional(string)
      }))
      crowdstrike_detects_settings = optional(object({
        authentication = optional(object({
          client_id      = optional(string)
          client_secret  = optional(string)
          token_endpoint = optional(string)
        }))
        hostname       = optional(string)
        ingestion_type = optional(string)
      }))
      dummy_log_type_settings = optional(object({
        api_endpoint = optional(string)
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
      }))
      duo_auth_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        hostname = optional(string)
      }))
      duo_user_context_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        hostname = optional(string)
      }))
      feed_source_type = optional(string)
      fox_it_stix_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        collection       = optional(string)
        poll_service_uri = optional(string)
        ssl = optional(object({
          encoded_private_key = optional(string)
          ssl_certificate     = optional(string)
        }))
      }))
      gcs_settings = optional(object({
        bucket_uri             = optional(string)
        source_deletion_option = optional(string)
        source_type            = optional(string)
      }))
      gcs_v2_settings = optional(object({
        bucket_uri             = string
        max_lookback_days      = optional(number)
        source_deletion_option = optional(string)
      }))
      google_cloud_identity_device_users_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
      }))
      google_cloud_identity_devices_settings = optional(object({
        api_version = optional(string)
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
      }))
      google_cloud_storage_event_driven_settings = optional(object({
        bucket_uri             = string
        max_lookback_days      = optional(number)
        pubsub_subscription    = string
        source_deletion_option = optional(string)
      }))
      http_settings = optional(object({
        source_deletion_option = optional(string)
        source_type            = optional(string)
        uri                    = optional(string)
      }))
      https_push_amazon_kinesis_firehose_settings = optional(object({
        split_delimiter = optional(string)
      }))
      https_push_google_cloud_pubsub_settings = optional(object({
        split_delimiter = optional(string)
      }))
      https_push_webhook_settings = optional(object({
        split_delimiter = optional(string)
      }))
      imperva_waf_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
      }))
      labels   = optional(map(string))
      log_type = string
      mandiant_ioc_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        start_time = optional(string)
      }))
      microsoft_graph_alert_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname  = optional(string)
        tenant_id = optional(string)
      }))
      microsoft_security_center_alert_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        hostname        = optional(string)
        subscription_id = optional(string)
        tenant_id       = optional(string)
      }))
      mimecast_mail_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        hostname = optional(string)
      }))
      mimecast_mail_v2_settings = optional(object({
        auth_credentials = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
      }))
      netskope_alert_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        content_type = optional(string)
        feedname     = optional(string)
        hostname     = optional(string)
      }))
      netskope_alert_v2_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        content_category = optional(string)
        content_types    = optional(list(string))
        hostname         = optional(string)
      }))
      office365_settings = optional(object({
        auth_endpoint = optional(string)
        authentication = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        content_type = optional(string)
        hostname     = optional(string)
        tenant_id    = optional(string)
      }))
      okta_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        hostname = optional(string)
      }))
      okta_user_context_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        hostname                   = optional(string)
        manager_id_reference_field = optional(string)
      }))
      pan_ioc_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        feed    = optional(string)
        feed_id = optional(string)
      }))
      pan_prisma_cloud_settings = optional(object({
        authentication = optional(object({
          password = optional(string)
          user     = optional(string)
        }))
        hostname = optional(string)
      }))
      proofpoint_mail_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
      }))
      proofpoint_on_demand_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        cluster_id = optional(string)
      }))
      pubsub_settings = optional(object({
        google_service_account_email = optional(string)
      }))
      qualys_scan_settings = optional(object({
        api_type = optional(string)
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        hostname = optional(string)
      }))
      qualys_vm_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        hostname = optional(string)
      }))
      rapid7_insight_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        endpoint = optional(string)
        hostname = optional(string)
      }))
      recorded_future_ioc_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
      }))
      rh_isac_ioc_settings = optional(object({
        authentication = optional(object({
          client_id      = optional(string)
          client_secret  = optional(string)
          token_endpoint = optional(string)
        }))
      }))
      salesforce_settings = optional(object({
        hostname = optional(string)
        oauth_jwt_credentials = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        oauth_password_grant_auth = optional(object({
          client_id      = optional(string)
          client_secret  = optional(string)
          password       = optional(string)
          token_endpoint = optional(string)
          user           = optional(string)
        }))
      }))
      sentinelone_alert_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        hostname                = optional(string)
        initial_start_time      = optional(string)
        is_alert_api_subscribed = optional(bool)
      }))
      service_now_cmdb_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        feedname = optional(string)
        hostname = optional(string)
      }))
      sftp_settings = optional(object({
        authentication = optional(object({
          password               = optional(string)
          private_key            = optional(string)
          private_key_passphrase = optional(string)
          username               = optional(string)
        }))
        source_deletion_option = optional(string)
        source_type            = optional(string)
        uri                    = optional(string)
      }))
      symantec_event_export_settings = optional(object({
        authentication = optional(object({
          client_id      = optional(string)
          client_secret  = optional(string)
          refresh_token  = optional(string)
          token_endpoint = optional(string)
        }))
      }))
      thinkst_canary_settings = optional(object({
        authentication = optional(object({
          header_key_values = optional(list(object({
            key   = optional(string)
            value = optional(string)
          })))
        }))
        hostname = optional(string)
      }))
      threat_connect_ioc_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        hostname = optional(string)
        owners   = optional(list(string))
      }))
      threat_connect_ioc_v3_settings = optional(object({
        authentication = optional(object({
          secret = optional(string)
          user   = optional(string)
        }))
        fields    = optional(list(string))
        hostname  = optional(string)
        owners    = optional(list(string))
        schedule  = optional(number)
        tql_query = optional(string)
      }))
      trellix_hx_alerts_settings = optional(object({
        authentication = optional(object({
          msso = optional(object({
            api_endpoint = optional(string)
            password     = optional(string)
            username     = optional(string)
          }))
          trellix_iam = optional(object({
            client_id     = optional(string)
            client_secret = optional(string)
            scope         = optional(string)
          }))
        }))
        endpoint = optional(string)
      }))
      trellix_hx_bulk_acqs_settings = optional(object({
        authentication = optional(object({
          msso = optional(object({
            api_endpoint = string
            password     = string
            username     = string
          }))
          trellix_iam = optional(object({
            client_id     = string
            client_secret = string
            scope         = string
          }))
        }))
        endpoint = string
      }))
      trellix_hx_hosts_settings = optional(object({
        authentication = optional(object({
          msso = optional(object({
            api_endpoint = string
            password     = string
            username     = string
          }))
          trellix_iam = optional(object({
            client_id     = string
            client_secret = string
            scope         = string
          }))
        }))
        endpoint = string
      }))
      webhook_settings = optional(object({
      }))
      workday_settings = optional(object({
        authentication = optional(object({
          client_id      = optional(string)
          client_secret  = optional(string)
          refresh_token  = optional(string)
          secret         = optional(string)
          token_endpoint = optional(string)
          user           = optional(string)
        }))
        hostname  = optional(string)
        tenant_id = optional(string)
      }))
      workspace_activity_settings = optional(object({
        applications = optional(list(string))
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_alerts_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_chrome_os_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_groups_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_mobile_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_privileges_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        workspace_customer_id = optional(string)
      }))
      workspace_users_settings = optional(object({
        authentication = optional(object({
          claims = optional(object({
            audience = optional(string)
            issuer   = optional(string)
            subject  = optional(string)
          }))
          rs_credentials = optional(object({
            private_key = optional(string)
          }))
          token_endpoint = optional(string)
        }))
        projection_type       = optional(string)
        workspace_customer_id = optional(string)
      }))
    }))
    failure_details = optional(object({
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

