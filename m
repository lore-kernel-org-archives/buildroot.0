From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 15:58:39 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] granite: fix md5 hash
Message-ID: <20170424193337.45BAF821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be1ab94c9eb66bd3c77bb73ddfd3a7813237d793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 04d8d5961566f8ba80b16defdf1fc10542158537)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
