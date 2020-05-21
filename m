From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 May 2020 16:43:40 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove python-pycrypto
Message-ID: <20200521144340.74028-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7ef76ed32fcd447391e26d33a555ff5dab6dc48e forgot to remove
python-pycrypto entry from DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5c0590d25..41bcbea39b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2252,7 +2252,6 @@ F:	package/davfs2/
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
-F:	package/python-pycrypto/
 F:	package/python-pysnmp/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
-- 
2.26.2
