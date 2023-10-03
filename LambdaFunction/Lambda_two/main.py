import json


def handler(event, context):
    event_slug = event["slug"]
    slug_list = ["Carle", "NMHS", "ChildrenNational", "Kingman", "Northwell"]

    if event_slug in slug_list:
        message = f"[SUCCESS] Database created for client : {event_slug}"
        return {"message": json.dumps(message)}

    else:
        return None
