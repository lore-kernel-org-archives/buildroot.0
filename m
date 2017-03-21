From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:00 +0100
Subject: [Buildroot] [git commit] aer-inject: remove redundant _SITE_METHOD
Message-ID: <20170321221729.997838032C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c29e5ba2143272958dd9ef31aa1eedceb6145920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _SITE has a git:// URL, so _SITE_METHOD is not needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aer-inject/aer-inject.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index 69189b1..e00570e 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -6,7 +6,6 @@
 
 AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
 AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
-AER_INJECT_SITE_METHOD = git
 AER_INJECT_LICENSE = GPLv2
 AER_INJECT_LICENSE_FILES = README
 AER_INJECT_DEPENDENCIES = host-flex host-bison
