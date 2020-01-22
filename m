From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:43 +0100
Subject: [Buildroot] [PATCH 11/26] package/bmon: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-12-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/bmon/bmon.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index dec0c7d81a..2cdf315a7f 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  02fdc312b8ceeb5786b28bf905f54328f414040ff42f45c83007f24b76cc9f7a  bmon-4.0.tar.gz
+sha256  59ae3d59c672bfb955917a8e32f5cacba7f8ce716c499a4c63dc8cd8cb5c4991  LICENSE.BSD
+sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSE.MIT
-- 
2.20.1
