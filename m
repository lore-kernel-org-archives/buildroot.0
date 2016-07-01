From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:22 +0200
Subject: [Buildroot] [PATCH 22/31] package/systemd: Disable IMA support
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-22-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c15ef58..313e781 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -31,6 +31,7 @@ SYSTEMD_CONF_OPTS += \
 	--disable-manpages \
 	--disable-selinux \
 	--disable-pam \
+	--disable-ima \
 	--disable-libcryptsetup \
 	--disable-efi \
 	--disable-gnuefi \
-- 
2.8.1
