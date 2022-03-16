LABEL maintainer="Yupei Chen <yupei.chen@goexpedi.com>"
LABEL repository="https://github.com/goexpedi/gxpd-dbt-action"
LABEL homepage="https://github.com/goexpedi/gxpd-dbt-action"

LABEL com.github.actions.name="GXPD dbt Action"
LABEL com.github.actions.description="Run and schedule dbt commands directly in your Github repo"
LABEL com.github.actions.icon="database"
LABEL com.github.actions.color="orange"


ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}
RUN apt-get update -y

RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-snowflake

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]