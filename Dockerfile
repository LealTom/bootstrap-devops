FROM elixir:otp-22
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh
COPY ./ ./
RUN mix deps.get && \
    mix ecto.create
CMD ["mix", "phx.server"]