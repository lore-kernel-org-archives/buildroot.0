From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 16:53:15 +0100
Subject: [Buildroot] [PATCH 1/1] minissdpd: add hash for license file
Message-ID: <20171202155315.29539-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minissdpd/minissdpd.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index 8d670f3e8..dd166775b 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	dfd637b185731e1acb412a86faa9718eb93c04ca08280541a6d22d14d1fb890f	minissdpd-1.5.tar.gz
+sha256	c432d6ee83deb6a0c105a2c3ebd11e3855ab91498b0847a8657e68ce8e4491a5	LICENSE
-- 
2.14.1
