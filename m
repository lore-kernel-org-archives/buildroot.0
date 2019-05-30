From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:23:09 +0200
Subject: [Buildroot] [git commit branch/next] package/cmake: add hash for
 license file
Message-ID: <20190530223346.6EB678E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08fa51ca33fe146bf0fcc01fb71a96006413205f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f138ac79a1..9e0159a3c8 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,5 @@
 # From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
 sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
+
+# Locally calculated
+sha256 af3030e1bf1af2f534430fdfe3cfc5a617966648a2a7f0c06a631adc92be1e5f  Copyright.txt
