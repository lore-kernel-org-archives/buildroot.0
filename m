From: Alexander Dahl <post@lespocky.de>
Date: Thu, 12 Sep 2019 11:14:30 +0200
Subject: [Buildroot] [PATCH 0/2] tz: bump version to 2019c
Message-ID: <20190912091432.13904-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

there's a fresh tz release from today, the announcement is here:

https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html

Not in the announcement to the leap second end of 2019, this is the
changeset in Git, which is part of the release: 

https://github.com/eggert/tz/commit/f90b1fced5f816dc29e9fc8a4c8496fa46d70be0

Greets
Alex

Alexander Dahl (2):
  package/tzdata: bump version to 2019c
  package/zic: bump verstion to 2019c

 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 4 ++--
 package/zic/zic.mk         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.11.0
