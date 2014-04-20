From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Apr 2014 01:25:11 +0200
Subject: [Buildroot] [PATCH 0/2] postgresql fix and update
Message-ID: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and Yann,

thanks for applying the postgresql package (and for reporting the
uClibc bug upstream).

Here two follow up patches (sorry for missing to disable the
automatic readline/zlib selection in the last version).

Regards,
Peter


Peter Seiderer (2):
  postgresql: change readline and zlib to be real optional selections
  postgresql: bump version to 9.3.4

 package/postgresql/Config.in     | 2 --
 package/postgresql/postgresql.mk | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
1.8.1.4
