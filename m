From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 17 Dec 2020 16:22:06 +0300
Subject: [Buildroot] [PATCH 0/2] fix timescaledb-1.7.4 build
Message-ID: <20201217132208.778308-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*** BLURB HERE ***

Maxim Kochetkov (2):
  package/postgresql: allow to select postgresql version
  package/timescaledb: add dependency on postgresql 12

 package/postgresql/Config.in       | 21 +++++++++++++++++++++
 package/postgresql/postgresql.hash |  3 +++
 package/postgresql/postgresql.mk   |  2 +-
 package/timescaledb/Config.in      |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.29.2
