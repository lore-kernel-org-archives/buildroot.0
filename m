From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:41 +0100
Subject: [Buildroot] [PATCH 09/26] package/audiofile: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-10-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/audiofile/audiofile.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/audiofile/audiofile.hash b/package/audiofile/audiofile.hash
index 3b9cba64f1..d2426e5991 100644
--- a/package/audiofile/audiofile.hash
+++ b/package/audiofile/audiofile.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256	cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965  audiofile-0.3.6.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
-- 
2.20.1
