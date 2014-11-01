From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:18:00 +0100
Subject: [Buildroot] [git commit] sconeserver: bump version
Message-ID: <20141101221821.AFA4AB2BE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b488b25dab787fc289fb125cf4e52c7c2880c527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sconeserver/sconeserver.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 6b91469..fd2123d 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -6,7 +6,7 @@
 
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Git commit.
-SCONESERVER_VERSION = d58f2de88c681939554089f786e360042a30c8f8
+SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
