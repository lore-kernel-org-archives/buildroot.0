From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Sep 2013 14:24:05 +0200
Subject: [Buildroot] [PATCH v2 4/6] systemd: set correct firmware search path
In-Reply-To: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1379679847-16141-5-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d371711..1afceed 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -34,6 +34,7 @@ SYSTEMD_CONF_OPT += \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
+	--with-firmware-path=/lib/firmware \
 	--enable-split-usr \
 	--enable-introspection=no \
 	--disable-efi \
--
1.7.9.5
