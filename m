From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 22 Jun 2021 15:41:19 +0300
Subject: [Buildroot] [PATCH 0/2] package/timescaledb: Bump version to 2.3.0
Message-ID: <20210622124121.999281-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump timescaledb version to 2.3.0

Maxim Kochetkov (2):
  package/postgresql: add cflags_sl option to pg_config
  package/timescaledb: Bump version to 2.3.0

 package/postgresql/pg_config         | 4 ++++
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.31.1
