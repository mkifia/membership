vcl 4.0;

backend default {
    .host = "back"; # The name of the Docker service for your backend
    .port = "9000"; # The port your backend listens on
}

sub vcl_backend_response {
    # Cache for 1 hour
    set beresp.ttl = 1h;

    # Other settings...
}
