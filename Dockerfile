FROM fishtownanalytics/dbt:1.0.0

LABEL maintainer="Yupei Chen <yupei.chen@goexpedi.com>"
LABEL repository="https://github.com/goexpedi/gxpd-dbt-action"
LABEL homepage="https://github.com/goexpedi/gxpd-dbt-action"

LABEL com.github.actions.name="GXPD dbt Action"
LABEL com.github.actions.description="Run and schedule dbt commands directly in your Github repo"
LABEL com.github.actions.icon="database"
LABEL com.github.actions.color="orange"

RUN apt-get update -y

RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-snowflake

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

#docker build --tag dbt_action:latest .