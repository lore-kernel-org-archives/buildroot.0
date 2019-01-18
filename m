From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:03:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] docs/manual: fix typo on
 Buildroot in adding-packages-waf.txt
Message-ID: <20190118130304.43F098A69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d44a7a4f8c30992c320757ba99c39e638539c52f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e969f8254110018e2883b9a93b31e3ad29878430)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
