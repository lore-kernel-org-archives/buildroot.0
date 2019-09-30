From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:48:00 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/ifplugd: license
 is GPL-2.0+
Message-ID: <20190930134253.6C312836CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb6cef57ab21a92ea66f5ea3b776fb65332c6c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d8c2d82d7a00412cd8d5f0079e6693d6462ca914)
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
 
