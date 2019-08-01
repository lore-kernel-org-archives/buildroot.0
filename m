From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:38:53 +0200
Subject: [Buildroot] [git commit] package/log4cpp: add license hash
Message-ID: <20190801073838.3FE7B813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3953811777b5b76266ba695f301c3a96022fbaea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cpp/log4cpp.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
index fd73988077..f79aabee9d 100644
--- a/package/log4cpp/log4cpp.hash
+++ b/package/log4cpp/log4cpp.hash
@@ -3,3 +3,4 @@ md5 b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
 sha1 74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
 # Locally computed
 sha256 2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
+sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  log4cpp/COPYING
