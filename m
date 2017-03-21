From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:06:59 +0100
Subject: [Buildroot] [PATCH 03/16] fmc: correct hash file
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It had sha256sum instead of sha256. This wasn't noticed before since
hashes for git downloads are not checked.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/fmc.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 2402831855..13d9d77ee5 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,2 +1,2 @@
-# Locally Computed
-sha256sum	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
+# Locally calculated
+sha256	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
-- 
2.11.0
