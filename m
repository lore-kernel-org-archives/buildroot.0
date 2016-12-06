From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 10:08:06 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: remove Tom Sparks
Message-ID: <20161206090903.1838F81DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=404413ec0a73bd8294026a74bb67aadc782f489c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tom privately notified that he is not able to support the packages he
originally added in Buildroot, so this commit removes him from the
DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f61afbc..e411b42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1512,12 +1512,6 @@ F:	toolchain/
 N:	Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
 F:	package/aer-inject/
 
-N:	Tom Sparks <tom_a_sparks@yahoo.com.au>
-F:	package/ibrcommon/
-F:	package/ibrdtn/
-F:	package/ibrdtn-tools/
-F:	package/ibrdtnd/
-
 N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
