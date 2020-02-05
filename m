From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:28:33 +0100
Subject: [Buildroot] [git commit] package/xen: fix hash of license file
Message-ID: <20200205191739.332A68D375@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f17792ed53e1dedb2938abb2ada90f8cb5a50356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xen was bumped from 4.12 to 4.13 in commit
268e5689b5219890df8cec6e77f8783a8d1f95a3, but the license file hash
was not updated. However, the license file has changed, with a new
paragraph about the Sphinx documentation being licensed under CC-BY
4.0 was added.  Update the SHA to match the new license.

Take this opportunity to re-align the hashes.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xen/xen.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 22a6083d9b..4224924652 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe xen-4.13.0.tar.gz
-sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
+sha256  c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe  xen-4.13.0.tar.gz
+sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
