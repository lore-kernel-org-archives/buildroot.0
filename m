From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:32:40 +0200
Subject: [Buildroot] [git commit] sh64: deprecate support for this dead
	architecture
Message-ID: <20150425083305.F28D57FF2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49aeacfcad4119b8b0158aa5cd467003c1b851f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the mailinglist, this should be deprecated
before removal.

[Thomas: don't add to Config.in.legacy.]

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 59bf84a..06aff2c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -163,6 +163,7 @@ config BR2_sh
 
 config BR2_sh64
 	bool "SuperH64"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
