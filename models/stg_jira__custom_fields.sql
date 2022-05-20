with custom_fields as (

    select
        distinct issue_field_history.issue_id,
        product.value as product,
        products.value as products,
        team.value as team,
        legal_entity_name.value as legal_entity_name,
        ein.value as ein,
        product_owner.value as product_owner,
        status_summary.value as status_summary,
        incident_type.value as incident_type,
        incident_caused_by.value as incident_caused_by,
        incident_restitution.value as incident_restitution,
        incident_loss.value as incident_loss,
        incident_regulatory_reporting_requiements.value as incident_regulatory_reporting_requiements,
        payroll_contact_email.value as payroll_contact_email,
        targeted_first_payroll_date.value as targeted_first_payroll_date,
        ops_watchers.value as ops_watchers,
        coalesce(plan_id.value, plan_id2.value, plan_id3.value, plan_id4.value, plan_id5.value) as plan_id,
        requesting_team.value as requesting_team,
        payroll_system.value as payroll_system,
        alert_type.value as alert_type,
        expected_date.value as expected_date,
        first_payroll_date.value as first_payroll_date,
        coalesce(record_keeper.value, record_keeper2.value, record_keeper3.value, record_keeper4.value, record_keeper5.value) as record_keeper,
        ops_task_type.value as ops_task_type,
        participant_transaction_type.value as participant_transaction_type,
        investment_sub_type.value as investment_sub_type,
        blackout_date.value as blackout_date,
        liquidation_date.value as liquidation_date,
        last_payroll_date.value as last_payroll_date,
        affected_plans_and_participants.value as affected_plans_and_participants,
        rk_ops_team.value as rk_ops_team,
        payroll_provider.value as payroll_provider,
        integration_type.value as integration_type,
        type.value as type,
        sub_type.value as sub_type,
        division.value as division,
        external_id.value as external_id,
        ucid.value as ucid,
        payroll_status.value as payroll_status,
        event_id.value as event_id,
        sponsor_id.value as sponsor_id,
        participant_id.value as participant_id,
        advisor.value as advisor

    from {{ ref('stg_jira__issue_field_history_tmp') }} issue_field_history
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10744') product on product.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10745') products on products.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10201') team on team.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10522') legal_entity_name on legal_entity_name.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10523') ein on ein.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10541') product_owner on product_owner.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10559') status_summary on status_summary.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10564') incident_type on incident_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10565') incident_caused_by on incident_caused_by.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10566') incident_restitution on incident_restitution.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10567') incident_loss on incident_loss.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10568') incident_regulatory_reporting_requiements on incident_regulatory_reporting_requiements.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10618') payroll_contact_email on payroll_contact_email.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10621') targeted_first_payroll_date on targeted_first_payroll_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10632') ops_watchers on ops_watchers.issue_id = issue_field_history.issue_id

    --need to bring in all plan_id fields till we sort out the duplicate issue
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10635') plan_id on plan_id.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10545') plan_id2 on plan_id2.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10664') plan_id3 on plan_id3.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10684') plan_id4 on plan_id4.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10691') plan_id5 on plan_id5.issue_id = issue_field_history.issue_id

    --need to bring in all recordkeeper fields till we sort out the duplicate issue
    left join (select ifh.issue_id, fo.name as value from {{ ref('stg_jira__issue_field_history_tmp') }} ifh join {{ ref ('stg_jira__field_option_tmp') }} fo on ifh.value = fo.id::string where ifh.is_active = True and ifh.field_id = 'customfield_10697') record_keeper on record_keeper.issue_id = issue_field_history.issue_id
    left join (select ifh.issue_id, fo.name as value from {{ ref('stg_jira__issue_field_history_tmp') }} ifh join {{ ref ('stg_jira__field_option_tmp') }} fo on ifh.value = fo.id::string where ifh.is_active = True and ifh.field_id = 'customfield_10637') record_keeper2 on record_keeper2.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10672') record_keeper3 on record_keeper3.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10681') record_keeper4 on record_keeper4.issue_id = issue_field_history.issue_id
    left join (select ifh.issue_id, fo.name as value from {{ ref('stg_jira__issue_field_history_tmp') }} ifh join {{ ref ('stg_jira__field_option_tmp') }} fo on ifh.value = fo.id::string where ifh.is_active = True and ifh.field_id = 'customfield_10701') record_keeper5 on record_keeper5.issue_id = issue_field_history.issue_id

    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10546') advisor on advisor.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10648') requesting_team on requesting_team.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10665') payroll_system on payroll_system.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10671') alert_type on alert_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10690') expected_date on expected_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10692') first_payroll_date on first_payroll_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10698') ops_task_type on ops_task_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10712') participant_transaction_type on participant_transaction_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10713') investment_sub_type on investment_sub_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10724') blackout_date on blackout_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10725') liquidation_date on liquidation_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10726') last_payroll_date on last_payroll_date.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10735') affected_plans_and_participants on affected_plans_and_participants.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10742') rk_ops_team on rk_ops_team.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10619') payroll_provider on payroll_provider.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10620') integration_type on integration_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10624') type on type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10674') sub_type on sub_type.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10675') division on division.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10676') external_id on external_id.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10677') ucid on ucid.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10678') payroll_status on payroll_status.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10679') event_id on event_id.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10702') sponsor_id on sponsor_id.issue_id = issue_field_history.issue_id
    left join (select issue_id, value from {{ ref('stg_jira__issue_field_history_tmp') }} where is_active = True and field_id = 'customfield_10703') participant_id on participant_id.issue_id = issue_field_history.issue_id
    )

select
    issue.key,
    custom_fields.*

from {{ ref('stg_jira__issue_tmp') }} issue
left join custom_fields on issue.id = custom_fields.issue_id
