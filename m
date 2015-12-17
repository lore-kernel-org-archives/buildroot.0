From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 16:31:43 +0100
Subject: [Buildroot] [git commit] dhrystone: add a hash file
Message-ID: <20151217161946.56F4D82489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11c3270e1421b0ab7d3a9a4682a8056d7b1fac4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhrystone/dhrystone.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
new file mode 100644
index 0000000..9ea22a3
--- /dev/null
+++ b/package/dhrystone/dhrystone.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
