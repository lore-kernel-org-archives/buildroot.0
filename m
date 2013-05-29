From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 19:14:24 +0200
Subject: [Buildroot] [git commit branch/next] logrotate: Bump version to
	3.8.4
Message-ID: <20130529185743.390D79A65F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fc981ab3ab04276371b4c4a0125f729323ba82f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The changelog for logrotate indicates some CVE's were fixed in 3.8.0.
(changelog at http://svn.fedorahosted.org/svn/logrotate/tags/r3-8-4/CHANGES)

Signed-off-by: Arne Rovet <arnerro@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/logrotate/logrotate.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index da8e4b3..c920b46 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -3,7 +3,7 @@
 # logrotate
 #
 #############################################################
-LOGROTATE_VERSION = 3.7.9
+LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
