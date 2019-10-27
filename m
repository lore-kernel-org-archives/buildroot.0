From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:53:32 +0100
Subject: [Buildroot] [git commit] package/flannel: remove 'v' prefix
Message-ID: <20191027104724.1AC7E88FD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b81a9d4a80478afc5189aac274965fdf560341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes version parsing for release-monitoring.org support.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flannel/flannel.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index d00d2df92c..0af06c7656 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = v0.5.5
+FLANNEL_VERSION = 0.5.5
 FLANNEL_SITE = https://github.com/coreos/flannel/archive
-FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
+FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
