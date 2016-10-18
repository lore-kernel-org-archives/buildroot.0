From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:12:57 +0200
Subject: [Buildroot] [git commit] wireshark: fix libgtk2 dependency typo
Message-ID: <20161018202210.8D70D7FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=638f0a817cc96da5ea983e41d75a0c447e121141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8dc72da..9cd92c4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -32,7 +32,7 @@ WIRESHARK_CONF_OPTS += --with-gtk=3
 WIRESHARK_DEPENDENCIES += libgtk3
 else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 WIRESHARK_CONF_OPTS += --with-gtk=2
-WIRESHARK_DEPENDECIES += libgtk2
+WIRESHARK_DEPENDENCIES += libgtk2
 else
 WIRESHARK_CONF_OPTS += --with-gtk=no
 endif
