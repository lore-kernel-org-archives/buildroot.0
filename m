From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:09:49 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] DEVELOPERS: remove
 python-pycrypto
Message-ID: <20200531211056.C1F7985F20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2ebc621bae0db9c262359310758767db99e8d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 7ef76ed32fcd447391e26d33a555ff5dab6dc48e forgot to remove
python-pycrypto entry from DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a00db9f80819982348e64834f76048c2c8381f40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3064e87eca..e6ad3f5bbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2169,7 +2169,6 @@ N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
 F:	package/python-pyasn/
-F:	package/python-pycrypto/
 F:	package/python-pysnmp/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
