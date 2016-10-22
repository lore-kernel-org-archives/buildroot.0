From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Oct 2016 14:58:07 +0200
Subject: [Buildroot] [git commit] rsyslog: bump version to 8.22.0
Message-ID: <20161022125828.AF58D80093@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7828bf001c4470ac4049400310854b97aa2c8fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 7dc341a..4fe6a0e 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	3379b30f2e6ef05a0f1c7327c73923fa5877a80b984506cdf48ed068c94a575e	rsyslog-8.19.0.tar.gz
+sha256	06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca	rsyslog-8.22.0.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 18a5737..a0875b7 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.19.0
+RSYSLOG_VERSION = 8.22.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3, LGPLv3, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
