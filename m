From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 22 Oct 2017 15:54:26 +0200
Subject: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add maintainer for
	pc_x86_64_* defconfigs
In-Reply-To: <20171022135426.28901-1-nunes.erico@gmail.com>
References: <20171022135426.28901-1-nunes.erico@gmail.com>
Message-ID: <20171022135426.28901-3-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been using this packages to test changes in the grub package, so
I can maintain them.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 448dd4bbce..f0f83b0f42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -535,6 +535,7 @@ F:	package/efivar/
 F:	package/fwts/
 F:	package/spi-tools/
 F:	package/xdotool/
+F:	configs/pc_x86_64_*
 
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
-- 
2.13.6
