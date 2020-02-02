From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 14:52:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: remove trailing whitespace in
 php.hash
Message-ID: <20200202135245.3841342-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A trailing whitespace was added by commit
26c16e9d5b2305e6da99762a254621fe257216be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/php.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index f4142cec80..69bc1cb6a5 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -3,4 +3,3 @@ sha256 98284deac017da0d426117ecae7599a1f1bf62ae3911e8bc16c4403a8f4bdf13  php-7.4
 
 # License file
 sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
-
-- 
2.24.1
