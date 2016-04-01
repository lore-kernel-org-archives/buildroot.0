From: Alexander Dahl <post@lespocky.de>
Date: Fri,  1 Apr 2016 08:39:44 +0200
Subject: [Buildroot] [PATCH 0/2] bump libuecc and fastd
Message-ID: <1459492786-14594-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

upstream released fastd v18 and libuecc v7 this week. Although fastd
v18 does not strictly depend von libuecc v7, I made patches for both.
Tested this quite short on fli4l (x86), so it builds and works in
general.

Greets
Alex

---

Alexander Dahl (2):
  libuecc: bump to v7
  fastd: bump to v18

 ...NTERPROCEDURAL_OPTIMIZATION-target-proper.patch |  33 +--
 .../0002-Don-t-depend-on-net-if_ether.h.patch      | 261 ---------------------
 package/fastd/fastd.mk                             |   2 +-
 package/libuecc/libuecc.mk                         |   2 +-
 4 files changed, 11 insertions(+), 287 deletions(-)
 delete mode 100644 package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch

-- 
2.1.4
