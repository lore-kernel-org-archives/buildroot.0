From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:04 +0100
Subject: [Buildroot] [git commit] ubus: add hash
Message-ID: <20170321221730.5C4967FDDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fb8d9f2e603a3f57800ce7f79b8a752ab3a6f76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ubus had a hash file, but is says "none" because it is a git download.
Since our git downloads are not reproducible, we can actually add a
hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ubus/ubus.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index af9b652..4e6a755 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,2 +1,2 @@
-# No hash for this git snapshot
-none  xxx  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
+# Locally calculated
+sha256  0dbf75c2103f3f567b9bf1bb719ea9776d18401bbf2dfd8bed2c2ebbdd1021da  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
