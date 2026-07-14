# Database Schema

<img width="2476" height="1484" alt="image" src="https://github.com/user-attachments/assets/f315aa40-49c8-4180-bec8-386543a19f93" />

## profiles

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | User's unique identifier |
| first_name | varchar | User's first name |
| last_name | varchar | User's last name |
| email | varchar | User's email address |
| phone | varchar | User's phone number |
| avatar_url | text | URL or storage path of the user's profile picture |
| created_at | timestamptz | Date and time when the user profile was created |
| updated_at | timestamptz | Date and time when the user profile was last updated |

## itineraries

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Itinerary's unique identifier |
| owner_id | UUID | Foreign key referencing profiles.id, representing the itinerary owner |
| title | varchar | Title of the itinerary |
| description | text | Brief description about the itinerary |
| start_date | date | Start date of the itinerary |
| end_date | date | End date of the itinerary |
| cover_image | text | URL or storage path of the itinerary's cover image |
| created_at | timestamptz | Date and time when the itinerary was created |
| updated_at | timestamptz | Date and time when the itinerary was last updated |

## itinerary_members

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Itinerary member's unique identifier |
| itinerary_id | UUID | Foreign key referencing itineraries.id, representing the associated itinerary |
| user_id | UUID | Foreign key referencing profiles.id, representing the associated user |
| role | varchar | User's role within the itinerary |
| joined_at | timestamptz | Date and time when the user joined the itinerary |

## activities

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Activity's unique identifier |
| itinerary_id | UUID | Foreign key referencing itineraries.id, representing the associated itinerary |
| created_by | UUID | Foreign key referencing profiles.id, representing the user who created the activity |
| type | varchar | Type of activity |
| title | varchar | Title of the activity |
| address | text | Address/location of the activity |
| provider | varchar | External service provider associated with the activity |
| external_place_id | text | Unique identifier assigned to the activity by the external service provider |
| start_datetime | timestamptz | Date and time when the activity starts |
| end_datetime | timestamptz | Date and time when the activity ends |
| notes | text | Additional notes/remarks for the activity |
| display_order | int2 | Display order of the activity |
| created_at | timestamptz | Date and time when the activity was created |
| updated_at | timestamptz | Date and time when the activity was last updated |

## flights

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Primary key and foreign key referencing activities.id, representing the associated flight activity |
| airline | varchar | Name of the airline operating the flight |
| flight_number | varchar | Flight number assigned by the airline |
| departure_airport | varchar | Departure airport code |
| arrival_airport | varchar | Arrival airport code |
| departure_terminal | varchar | Departure terminal of the flight |
| arrival_terminal | varchar | Arrival terminal of the flight |
| departure_gate | varchar | Departure gate of the flight |
| arrival_gate | varchar | Arrival gate of the flight |
| seat | varchar | Assigned seat number |
| booking_reference | varchar | Booking reference number |
| created_at | timestamptz | Date and time when the flight was created |

## expenses

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Expense's unique identifier |
| itinerary_id | UUID | Foreign key referencing itineraries.id, representing the associated itinerary |
| activity_id | UUID | Foreign key referencing activities.id, representing the associated activity |
| paid_by | UUID | Foreign key referencing profiles.id, representing the user who paid the expense |
| title | varchar | Title of the expense |
| amount | numeric | Total amount of the expense |
| currency | varchar | Currency of the expense |
| expense_date | date | Date when the expense was incurred |
| receipt_url | text | URL or storage path of the expense receipt |
| notes | text | Additional notes/remarks for the expense |
| created_at | timestamptz | Date and time when the expense was created |

## expense_splits

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Expense split's unique identifier |
| expense_id | UUID | Foreign key referencing expenses.id, representing the associated expense |
| user_id | UUID | Foreign key referencing profiles.id, representing the user responsible for the expense split |
| amount | numeric | Amount allocated to the user for the expense |
| status | varchar | Payment status of the expense split, default value 'Pending' |

## invitations

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Invitation's unique identifier |
| itinerary_id | UUID | Foreign key referencing itineraries.id, representing the associated itinerary |
| created_by | UUID | Foreign key referencing profiles.id, representing the user who created the invitation |
| invite_token | text | Stores the invitation link |
| expires_at | timestamptz | Date and time when the invitation link expires |
| created_at | timestamptz | Date and time when the invitation was created |

## chat_messages

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Chat message's unique identifier |
| user_id | UUID | Foreign key referencing profiles.id, representing the user associated with the chat message |
| role | varchar | Role of the message sender |
| message | text | Content of the chat message |
| created_at | timestamptz | Date and time when the chat message was created |

## saved_places

| Name  |  Type | Description |
| ------------- | ------------- | ------------- |
| id | UUID | Saved place's unique identifier |
| user_id | UUID | Foreign key referencing profiles.id, representing the user who saved the place |
| provider | varchar | External service provider associated with the saved place |
| external_place_id | text | Unique identifier assigned to the place by the external service provider |
| name | varchar | Name of the saved place |
| address | text | Address of the saved place |
| created_at | timestamptz | Date and time when the place was saved |




