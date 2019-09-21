From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:42 +0200
Subject: [Buildroot] [git commit] package/pppd: add missing file hashes
Message-ID: <20190921135525.EC4F88EE01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09d5d650c6eb2b645dd50e6a5b6d45bd95109f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

for :
* pppd/tdb.c
* pppd/plugins/pppoatm/COPYING
* pppdump/bsd-comp.c
* pppd/ccp.c
* pppd/plugins/passprompt.c

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pppd/pppd.hash | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index 2bc248d89f..2baa6939e4 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,2 +1,9 @@
 # Locally calculated after checking pgp signature
 sha256	02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30	ppp-2.4.7.tar.gz
+
+# Locally calculated
+sha256	3990c65c506885f7bb75455d1d6188743a14ad46f5b62e136ef3739aed52c532	pppd/tdb.c
+sha256	1822ead9d2854adfbd282322b29730a3fec4cc67f6f6a2e487aad3476e3afd59	pppd/plugins/pppoatm/COPYING
+sha256	91a5e9c173e0e001e081e15bf7850cfd782a0baa02f5921e327ae3b449beff3f	pppdump/bsd-comp.c
+sha256	41f7dbfa7c80940be74803c456c3a28f218b13a9e51e9777d3e9cb4cb6b4e692	pppd/ccp.c
+sha256	6fa4c3dad059f6ef15c1c5e5219d9d0d40991dd3a162098a89967a1720de059e	pppd/plugins/passprompt.c
