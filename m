From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:06:58 +0100
Subject: [Buildroot] [PATCH 02/16] aer-inject: remove redundant _SITE_METHOD
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The _SITE has a git:// URL, so _SITE_METHOD is not needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
---
 package/aer-inject/aer-inject.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index 69189b1668..e00570e272 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -6,7 +6,6 @@
 
 AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
 AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
-AER_INJECT_SITE_METHOD = git
 AER_INJECT_LICENSE = GPLv2
 AER_INJECT_LICENSE_FILES = README
 AER_INJECT_DEPENDENCIES = host-flex host-bison
-- 
2.11.0
