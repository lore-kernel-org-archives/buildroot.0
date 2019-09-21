From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:42 +0200
Subject: [Buildroot] [git commit] package/nss-pam-ldapd: add missing hash
 for COPYING file
Message-ID: <20190921135525.E05FE8EE01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20595bfd50eac0390aba9d9a8f7b4d57542725e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
