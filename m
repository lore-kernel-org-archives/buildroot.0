From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:16:40 +0200
Subject: [Buildroot] [git commit] package/pcre: add host variant
Message-ID: <20141004173528.422619D824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f37778ab87e40a6be43434a6c38bbd4d1b8961a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by leafnode2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre/pcre.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index f4f85c2..4ff7abd 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -23,3 +23,4 @@ PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
