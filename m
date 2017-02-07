From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 10:02:14 +0100
Subject: [Buildroot] [git commit] ipsec-tools: fix typo in variable name
Message-ID: <20170207090318.DD1EC81D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4654d0e9950ff9072e5282fe48c5fe8a185bbf3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/ipsec-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 98216ea..eb910bc 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -57,7 +57,7 @@ endif
 ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE),y)
 IPSEC_TOOLS_CONF_OPTS += --without-readline
 else
-IPSEC_DEPENDENCIES += readline
+IPSEC_TOOLS_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_HYBRID),y)
