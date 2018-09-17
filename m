From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 17 Sep 2018 23:12:19 +0200
Subject: [Buildroot] [PATCH 2/2] at: add sha256 for legal-info files
In-Reply-To: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
References: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180917211219.17868-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copyright and COPYING file sha256 are missing.

Add them calculating locally.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/at/at.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/at/at.hash b/package/at/at.hash
index e6eb26d818..530b1257c1 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
+
+sha256 01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
-- 
2.17.1
