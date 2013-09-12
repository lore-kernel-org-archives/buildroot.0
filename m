From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 21:56:13 -0300
Subject: [Buildroot] [PATCH 5/5] ser2net: bump to version 2.9.1
In-Reply-To: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378947373-4767-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ser2net/ser2net.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 23ae48a..5e77d36 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.9
+SER2NET_VERSION = 2.9.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
-# shipped configure script is broken (libtool version error)
-SER2NET_AUTORECONF = YES
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
