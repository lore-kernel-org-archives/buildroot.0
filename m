From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:06:05 +0200
Subject: [Buildroot] [git commit] uclibc: enable UCLIBC_HAS_UTMP in snapshot
	configuration
Message-ID: <20150416060609.D3DDE818A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95ef315f5994afcdccdee5cecb16ed2e8ffe9e2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise busybox in the default configuration fails to build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 6f5ebfa..ac3d9b0 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -237,6 +237,7 @@ UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
+UCLIBC_HAS_UTMP=y
 UCLIBC_HAS_UTMPX=y
 
 #
