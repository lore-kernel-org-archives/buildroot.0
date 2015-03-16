From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 10:23:26 +0100
Subject: [Buildroot] [git commit] ofono: refer to explicit hash source
Message-ID: <20150316092337.8E7C380829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3c9f265e68542466ff35e75cb08b3c0d0ece5ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ofono/ofono.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index ddf9bf0..e83ce1a 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
+# From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
 sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz
