From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 26 Aug 2018 14:23:07 +0200
Subject: [Buildroot] [PATCH v4 2/3] minicom: add hash file for git tarball
In-Reply-To: <20180826122308.90382-1-giulio.benetti@micronovasrl.com>
References: <89c54af3-3000-d0c5-ab7f-f6d4f4c092eb@micronovasrl.com>
 <20180826122308.90382-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180826122308.90382-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is not hash file in minicom package.

Create minicom.hash and sha256 for git tarball.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/minicom/minicom.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/minicom/minicom.hash

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
new file mode 100644
index 0000000000..0e94e566e7
--- /dev/null
+++ b/package/minicom/minicom.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
-- 
2.17.1
