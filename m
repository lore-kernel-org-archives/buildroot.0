From: Martin Bark <martin@barkynet.com>
Date: Sun, 17 Mar 2019 20:47:59 +0000
Subject: [Buildroot] [PATCH 1/2] package/nodejs: correct license file hash
Message-ID: <20190317204800.17703-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LICENSE file in nodejs 10.15.3 updated to include additional
3rd party licenses.

Fixes:
 - http://autobuild.buildroot.net/results/4bf66b9f05e9d04171156e44c7dd87619e429747
 - http://autobuild.buildroot.net/results/a65776ba1045f12263a686933eb6a4b5d6ff7333
 - http://autobuild.buildroot.net/results/aab619106a7d763f45e95a7ae3d85816fb4a6512
 - http://autobuild.buildroot.net/results/bb6cb93f323be22e4c0efc05011042526c01f62c

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e9c174e662..6cb2cdd5b7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -2,4 +2,4 @@
 sha256 4e22d926f054150002055474e452ed6cbb85860aa7dc5422213a2002ed9791d5  node-v10.15.3.tar.xz
 
 # Hash for license file
-sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
+sha256 7ab373b3671d57d91078f5345ea9486443c9ca498eb9f8cf87dee2641a6fa09d  LICENSE
-- 
2.21.0
