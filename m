From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:29 +0000
Subject: [Buildroot] [PATCH 3/9] package/nss-pam-ldapd: add missing hash for
 COPYING file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-4-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index 66cb794063..a4d189c1d4 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -2,3 +2,4 @@
 md5 8c99fdc54f4bf9aca8c5f53fdb1403ff  nss-pam-ldapd-0.9.8.tar.gz
 # Locally computed:
 sha256 ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f  nss-pam-ldapd-0.9.8.tar.gz
+sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
-- 
2.20.1
