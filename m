From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Tue, 01 Sep 2015 17:38:12 +0200
Subject: [Buildroot] [PATCHv2 1/1] tar: Move tar package to
	'system-tools' menu
In-Reply-To: <12995385.iRNRCdloQv@deathstar>
References: <12995385.iRNRCdloQv@deathstar>
Message-ID: <26699841.fIxtxEPbfV@deathstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 package/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 521deb4..58b7380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1505,8 +1505,6 @@ endif
        source "package/systemd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
        source "package/sysvinit/Config.in"
-endif
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
        source "package/tar/Config.in"
 endif
        source "package/util-linux/Config.in"
-- 
2.5.0
