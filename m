From: Alexander Dahl <post@lespocky.de>
Date: Sat,  2 Apr 2016 12:38:26 +0200
Subject: [Buildroot] [PATCH v2 0/2] bump libuecc and fastd
Message-ID: <1459593508-24597-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

I repost this mini series because I noticed upstream has actually
release tarballs with checksums. The maintainer said those will stay
where they are. A little annoying is the base URLs are not stable
because those are attachments in a wiki, but one can take care of in
the foo.mk files then.

Tested v2 with fli4l on x86 and x86_64.

More hints in the patches itself.

Greets
Alex

Alexander Dahl (2):
  libuecc: bump to v7
  fastd: bump to v18

 ...NTERPROCEDURAL_OPTIMIZATION-target-proper.patch |  33 +--
 .../0002-Don-t-depend-on-net-if_ether.h.patch      | 261 ---------------------
 package/fastd/fastd.hash                           |   4 +
 package/fastd/fastd.mk                             |   5 +-
 package/libuecc/libuecc.hash                       |   4 +
 package/libuecc/libuecc.mk                         |   5 +-
 6 files changed, 23 insertions(+), 289 deletions(-)
 delete mode 100644 package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch
 create mode 100644 package/fastd/fastd.hash
 create mode 100644 package/libuecc/libuecc.hash

-- 
2.1.4
