From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Apr 2017 16:02:46 +0100
Subject: [Buildroot] [PATCH] granite: fix md5 hash
Message-ID: <20170410150246.27525-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/granite/granite.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index 3c89685..e073307 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,4 +1,4 @@
 # From https://launchpad.net/granite/0.4/0.4.0.1/+download/granite-0.4.0.1.tar.xz/+md5
-md5	db41150ca6e77162392362686e848086	granite-0.3.1.tar.xz
+md5	db41150ca6e77162392362686e848086	granite-0.4.0.1.tar.xz
 # Calculated based on the hash above
 sha256	95a142a8befeedc35a089d638e759b657905508dc3007036d6c1fa3efe94c4dd	granite-0.4.0.1.tar.xz
-- 
2.10.2
