From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 15:00:32 +0200
Subject: [Buildroot] [git commit] dmidecode: add license info
Message-ID: <20131004130855.CF3679B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=169f1194c37a6cd418d119cc59072d5ca3b9bdb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmidecode/dmidecode.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index c53bd33..e39d97d 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -6,6 +6,8 @@
 
 DMIDECODE_VERSION = 2.12
 DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+DMIDECODE_LICENSE = GPLv2+
+DMIDECODE_LICENSE_FILES = LICENSE
 
 define DMIDECODE_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
