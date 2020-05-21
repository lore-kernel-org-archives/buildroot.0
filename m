From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 May 2020 17:05:20 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: remove python-pycrypto
Message-ID: <20200521144847.05DFC91B06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00db9f80819982348e64834f76048c2c8381f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7ef76ed32fcd447391e26d33a555ff5dab6dc48e forgot to remove
python-pycrypto entry from DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab6d4ead1b..d1426f6227 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2250,7 +2250,6 @@ F:	package/davfs2/
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
-F:	package/python-pycrypto/
 F:	package/python-pysnmp/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
