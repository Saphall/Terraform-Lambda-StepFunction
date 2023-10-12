"""
Lambda to check if provided `client_name` is valid or not.
"""

import random


def handler(event, context):
    """
    AWS Lambda function to validate a 'client_name' and return a modified value if valid.

    This Lambda function receives an 'event' with a 'client_name' key, and it checks if the
    provided 'client_name' is valid by comparing it to a list of known 'valid_clients.' If
    the 'client_name' is valid, the function replaces it with a random choice from the list
    of valid clients; otherwise, it sets 'client_name' to None.

    Parameters:
    - event (dict): A dictionary containing event data with a 'client_name' key.
    - context: The context in which the function is executed. (AWS Lambda-specific)

    Returns:
    dict: A dictionary containing the processed 'client_name' value. If the 'client_name' is
    valid, it is replaced with a random valid client name; otherwise, it is set to None.
    """
    client = event["client_name"]

    if check_client(client):
        client_name = check_client(client)
    else:
        client_name = None

    return {"client_name": client_name}


def check_client(client):
    """
    Check if the provided 'client' is in the list of valid clients.

    Parameters:
    - client (str): The client name to be validated.

    Returns:
    str or None: If 'client' is in the list of valid clients, a random valid client name
    is returned; otherwise, None is returned.
    """
    valid_clients = ["nike", "adidas", "jordan", "puma"]
    if client.lower() in valid_clients:
        return random.choice(valid_clients)
    else:
        return None
