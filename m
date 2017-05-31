From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:51:48 +0200
Subject: [Buildroot] [git commit branch/next] lxc: fix hash of patch
Message-ID: <20170531195443.533AE8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa78048514883b5f148e235acb219f3035468a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix hash of bc5b27d6f6d166d2a6df47982cbe36041ce6b73.patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 801759a..501f869 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256	0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	lxc-2.0.8.tar.gz
-sha256	c79443c5db7e7defd53992d120cad2bc8afc2ff363b1e84ec31bc2b95ec5ca44	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
+sha256	16cf466db42a45bd579bdb66efbeb63764cd93d049f05a6d8a659846cab9b47f	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
