import json
import random


def handler(event, context):
    # print(event)

    event_slug = event["slug"]
    receive_client_data_from_api = event["receive_client_data_from_api"]

    if receive_client_data_from_api == "false":
        slug = test_slug(event_slug)
    else:
        slug = None

    return {"slug": slug}


def test_slug(slug):
    test_slugs = ["Carle", "NMHS", "ChildrenNational", "Kingman", "Northwell"]
    if slug in test_slugs:
        return random.choice(test_slugs)
    else:
        return None
