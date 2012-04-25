From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 10:45:30 +0200
Subject: [Buildroot] [git commit] target/: mark Xtensa architecture support
	as deprecated
Message-ID: <20120425084752.399B096BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=555c2585bf28c3ef71f6d2dcdd983d17a19892af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hasn't been updated since it was added in 2009, and requires quite
some special handling in BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index f8ab84e..e7a18f7 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -124,6 +124,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	depends on BR2_DEPRECATED
 	help
 	  Xtensa is a Tensilica processor IP architecture.
 	  http://en.wikipedia.org/wiki/Xtensa
