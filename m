From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Sep 2014 23:16:30 +0200
Subject: [Buildroot] [git commit] lua: add hash
Message-ID: <20140919211740.A1E859D6C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f66f3cdb7a16ee767a3db925949f84e20c7fa5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup hash file syntax]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.hash |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.hash b/package/lua/lua.hash
new file mode 100644
index 0000000..3de90c2
--- /dev/null
+++ b/package/lua/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: http://www.lua.org/ftp/
+md5 dc7f94ec6ff15c985d2d6ad0f1b35654           lua-5.2.3.tar.gz
+sha1 926b7907bc8d274e063d42804666b40a3f3c124c  lua-5.2.3.tar.gz
+
+md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
+sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
