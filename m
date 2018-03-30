From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 31 Mar 2018 00:29:13 +0530
Subject: [Buildroot] [PATCH 2/4] opusfile: add hash for license file
In-Reply-To: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1522436355-5697-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/opusfile/opusfile.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 528ded2..59e0819 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 f75fb500e40b122775ac1a71ad80c4477698842a8fe9da4a1b4a1a9f16e4e979  opusfile-0.9.tar.gz
+
+# Hash for license file
+sha256 0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
-- 
2.7.4
