From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:21 +0200
Subject: [Buildroot] [PATCH 21/31] package/systemd: Disable the test coverage
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-21-git-send-email-maxime.hadjinlian@gmail.com>
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
index e3aacc6..c15ef58 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -36,6 +36,7 @@ SYSTEMD_CONF_OPTS += \
 	--disable-gnuefi \
 	--disable-ldconfig \
 	--disable-tests \
+	--disable-coverage \
 	--with-default-dnssec=no \
 	--without-python
 
-- 
2.8.1
