From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:40 +0200
Subject: [Buildroot] [PATCH 02/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66445ff..2588a7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -507,6 +507,7 @@ menu "Other"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/classpath/Config.in"
+source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
-- 
1.7.7.6
