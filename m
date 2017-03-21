From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:01 +0100
Subject: [Buildroot] [git commit] fmc: correct hash file
Message-ID: <20170321221730.0032B7FDDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba717fde72c862a283a035b3b44377bb48d08284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It had sha256sum instead of sha256. This wasn't noticed before since
hashes for git downloads are not checked.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmc/fmc.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 2402831..13d9d77 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,2 +1,2 @@
-# Locally Computed
-sha256sum	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
+# Locally calculated
+sha256	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
