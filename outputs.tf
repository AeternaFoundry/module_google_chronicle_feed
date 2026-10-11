output "chronicle_feeds_id" {
  description = "Map of id values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no id are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.id if v.id != null && length(v.id) > 0 }
}
output "chronicle_feeds_deletion_policy" {
  description = "Map of deletion_policy values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no deletion_policy are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "chronicle_feeds_details" {
  description = "Map of details values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no details are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => one(v.details) if v.details != null && length(v.details) > 0 }
  sensitive   = true
}
output "chronicle_feeds_display_name" {
  description = "Map of display_name values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no display_name are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "chronicle_feeds_enabled" {
  description = "Map of enabled values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no enabled are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.enabled if v.enabled != null }
}
output "chronicle_feeds_failure_details" {
  description = "Map of failure_details values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no failure_details are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => one(v.failure_details) if v.failure_details != null && length(v.failure_details) > 0 }
}
output "chronicle_feeds_failure_msg" {
  description = "Map of failure_msg values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no failure_msg are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.failure_msg if v.failure_msg != null && length(v.failure_msg) > 0 }
}
output "chronicle_feeds_feed" {
  description = "Map of feed values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no feed are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.feed if v.feed != null && length(v.feed) > 0 }
}
output "chronicle_feeds_feed_service_account" {
  description = "Map of feed_service_account values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no feed_service_account are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.feed_service_account if v.feed_service_account != null && length(v.feed_service_account) > 0 }
}
output "chronicle_feeds_instance" {
  description = "Map of instance values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no instance are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.instance if v.instance != null && length(v.instance) > 0 }
}
output "chronicle_feeds_last_feed_initiation_time" {
  description = "Map of last_feed_initiation_time values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no last_feed_initiation_time are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.last_feed_initiation_time if v.last_feed_initiation_time != null && length(v.last_feed_initiation_time) > 0 }
}
output "chronicle_feeds_location" {
  description = "Map of location values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no location are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.location if v.location != null && length(v.location) > 0 }
}
output "chronicle_feeds_name" {
  description = "Map of name values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no name are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.name if v.name != null && length(v.name) > 0 }
}
output "chronicle_feeds_project" {
  description = "Map of project values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no project are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.project if v.project != null && length(v.project) > 0 }
}
output "chronicle_feeds_read_only" {
  description = "Map of read_only values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no read_only are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.read_only if v.read_only != null }
}
output "chronicle_feeds_reference_id" {
  description = "Map of reference_id values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no reference_id are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.reference_id if v.reference_id != null && length(v.reference_id) > 0 }
}
output "chronicle_feeds_secret" {
  description = "Map of secret values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no secret are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.secret if v.secret != null && length(v.secret) > 0 }
  sensitive   = true
}
output "chronicle_feeds_state" {
  description = "Map of state values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no state are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.state if v.state != null && length(v.state) > 0 }
}
output "chronicle_feeds_uid" {
  description = "Map of uid values across all chronicle_feeds, keyed the same as var.chronicle_feeds except keys with no uid are omitted"
  value       = { for k, v in google_chronicle_feed.chronicle_feeds : k => v.uid if v.uid != null && length(v.uid) > 0 }
}

