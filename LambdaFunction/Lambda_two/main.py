"""
Lambda function to check if the provided 'client_name' is in a list of valid clients.

This Lambda function receives an 'event' with a 'client_name' key and checks if the
lowercased 'client_name' is in the list of valid clients. If it is, a success message is
generated with the client name and a message indicating the creation of a database for
that client.

Parameters:
- event (dict): A dictionary containing event data with a 'client_name' key.
- context: The context in which the function is executed. (AWS Lambda-specific)

Returns:
dict or None: If the 'client_name' is in the list of valid clients, a success message
is returned; otherwise, None is returned.
"""
import json


def handler(event, context):
    client = event["client_name"]
    valid_clients = ["nike", "adidas", "jordan", "puma"]

    if client.lower() in valid_clients:
        message = f'[SUCCESS] Database -> |{client.lower()}| created for client : {client}.'
        return {"message": json.dumps(message)}

    else:
        return None
