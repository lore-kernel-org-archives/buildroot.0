From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:32:46 +0100
Subject: [Buildroot] [git commit] docs/manual: fix typo on Buildroot in
 adding-packages-waf.txt
Message-ID: <20181226212837.1EFB58379F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e969f8254110018e2883b9a93b31e3ad29878430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-waf.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index 43b557c070..12e122fb87 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -63,7 +63,7 @@ also be defined.
 * +LIBFOO_NEEDS_EXTERNAL_WAF+ can be set to +YES+ or +NO+ to tell
   Buildroot to use the bundled +waf+ executable. If set to +NO+, the
   default, then Buildroot will use the waf executable provided in the
-  package source tree; if set to +YES+, then Buidlroot will download,
+  package source tree; if set to +YES+, then Buildroot will download,
   install waf as a host tool and use it to build the package.
 
 * +LIBFOO_WAF_OPTS+, to specify additional options to pass to the
