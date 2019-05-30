From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:30:46 +0200
Subject: [Buildroot] [git commit] package/polkit: add hash for license file
Message-ID: <20190602201236.DFB6A8EDEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70245b35d8e8ef222ff63b3cdb647afee3e22fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 1fe8607fbf..6368091c4a 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	8fdc7cc8ba4750fcce1a4db9daa759c12afebc7901237e1c993c38f08985e1df	polkit-0.105.tar.gz
+
+# Locally calculated
+sha256	d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8	COPYING
