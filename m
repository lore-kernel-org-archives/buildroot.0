From: Alexander Dahl <post@lespocky.de>
Date: Mon, 27 Apr 2020 09:11:42 +0200
Subject: [Buildroot] [PATCH 0/2] tz: bump to version 2020a
Message-ID: <20200427071144.30237-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

the 2020a release of the timezone database tz code and data is
available ? announcement here:

https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html

Nice to have for stable.

Greets
Alex

Alexander Dahl (2):
  package/tzdata: bump to version 2020a
  package/zic: bump to version 2020a

 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 4 ++--
 package/zic/zic.mk         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.11.0
