From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:43:35 +0100
Subject: [Buildroot] [git commit] poppler: fix typo in variable name
Message-ID: <20170207090318.845E981D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94a39b017882f4cbe0c7cd863bf6a9c27fe4b35d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index c40d5ff..3e8a9f4 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_CAIRO),y)
 POPPLER_CONF_OPTS += --enable-cairo-output
 POPPLER_DEPENDENCIES += cairo
 else
-POPLER_CONF_OPTS += --disable-cairo-output
+POPPLER_CONF_OPTS += --disable-cairo-output
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
