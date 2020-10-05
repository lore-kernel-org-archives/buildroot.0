From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon,  5 Oct 2020 13:19:49 +0300
Subject: [Buildroot] [PATCH 0/2] package/timescaledb: new package
Message-ID: <20201005101951.3112095-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds timescaledb v1.7.4:

TimescaleDB is an open-source database designed to make SQL scalable
for time-series data. It is engineered up from PostgreSQL and packaged
as a PostgreSQL extension, providing automatic partitioning across time
and space (partitioning key), as well as full SQL support.

Maxim Kochetkov (2):
  package/postgresql: add configure and includedir-server output to
    pg_config
  package/timescaledb: new package

 package/Config.in                    |  1 +
 package/postgresql/pg_config         |  8 +++++++-
 package/postgresql/postgresql.mk     |  1 +
 package/timescaledb/Config.in        | 11 +++++++++++
 package/timescaledb/timescaledb.hash |  3 +++
 package/timescaledb/timescaledb.mk   | 22 ++++++++++++++++++++++
 6 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/timescaledb/Config.in
 create mode 100644 package/timescaledb/timescaledb.hash
 create mode 100644 package/timescaledb/timescaledb.mk

-- 
2.27.0
