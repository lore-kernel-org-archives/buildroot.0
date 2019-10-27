From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:49:30 -0500
Subject: [Buildroot] [PATCH] package/dt: remove 'v' prefix from
 github-fetched packages
Message-ID: <20191027064930.15811-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/dt/dt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dt/dt.mk b/package/dt/dt.mk
index 8ec7788883..1963a7ecc5 100644
--- a/package/dt/dt.mk
+++ b/package/dt/dt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DT_VERSION = v18.32
+DT_VERSION = 18.32
 DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
-DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
+DT_SOURCE = dt-source-v$(DT_VERSION).tar.gz
 DT_STRIP_COMPONENTS = 2
 DT_LICENSE = ISC-like
 DT_LICENSE_FILES = LICENSE
-- 
2.17.1
