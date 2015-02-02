From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:20:26 +0100
Subject: [Buildroot] [git commit] lua: add missing hash for lua 5.3.0
Message-ID: <20150202202101.C8588800A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8078ae970afe5fbe21afbf18e0bb0e7b77ad0e3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 3de90c2..b6ac026 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,4 +1,7 @@
 # Hashes from: http://www.lua.org/ftp/
+md5 a1b0a7e92d0c85bbff7a8d27bf29f8af           lua-5.3.0.tar.gz
+sha1 1c46d1c78c44039939e820126b86a6ae12dadfba  lua-5.3.0.tar.gz
+
 md5 dc7f94ec6ff15c985d2d6ad0f1b35654           lua-5.2.3.tar.gz
 sha1 926b7907bc8d274e063d42804666b40a3f3c124c  lua-5.2.3.tar.gz
 
