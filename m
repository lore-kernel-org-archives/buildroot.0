From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:27:02 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/logsurfer: use hashes provided
	by upstream
Message-ID: <20170805092702.26670-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/logsurfer/logsurfer.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
index 2c14078f7..539a41a3c 100644
--- a/package/logsurfer/logsurfer.hash
+++ b/package/logsurfer/logsurfer.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
+# From https://www.crypt.gen.nz/logsurfer/
+md5 4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
+sha256 74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
-- 
2.11.0
