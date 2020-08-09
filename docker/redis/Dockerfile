FROM redis:6.0.6

# Config
COPY redis.conf /usr/local/etc/redis/redis.conf

# Redistimeseries
COPY redistimeseries.so /usr/local/etc/redis/redistimeseries.so

EXPOSE 6379

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
