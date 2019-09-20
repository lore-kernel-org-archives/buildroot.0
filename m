From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 09:21:22 +0200
Subject: [Buildroot] [PATCH] package/ifplugd: license is GPL-2.0+
Message-ID: <20190920072122.3565-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The source files contain the "(at your option) any later version" text and
the website states:

License

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.

http://0pointer.de/lennart/projects/ifplugd/

So change the license to GPL-2.0+

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifplugd/ifplugd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index c7874b49e5..06b0607414 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -6,7 +6,7 @@
 
 IFPLUGD_VERSION = 0.28
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
-IFPLUGD_LICENSE = GPL-2.0
+IFPLUGD_LICENSE = GPL-2.0+
 IFPLUGD_LICENSE_FILES = LICENSE
 IFPLUGD_AUTORECONF = YES
 
-- 
2.20.1
