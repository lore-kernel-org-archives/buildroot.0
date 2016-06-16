From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jun 2016 16:56:55 +0300
Subject: [Buildroot] [PATCH v2] faketime: add .hash file
Message-ID: <2b93c8b6cf5b55c743e826fe760e4fece9d78f29.1466085415.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/872/8724d7335a699e162aee5f25d8eb2e71310b5c55/
http://autobuild.buildroot.net/results/cdb/cdb6a55efa0a3d86e213aba55ddaeb52d24cf1c6/
http://autobuild.buildroot.net/results/a5f/a5f12f44a2b5d758aed5e4666897cb6eedfc1444/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: add SoB
---
 package/faketime/faketime.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/faketime/faketime.hash

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
new file mode 100644
index 000000000000..a17ef8526bd0
--- /dev/null
+++ b/package/faketime/faketime.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 56bc32006f4c5b021ff648cc1fd458c5316f40aadfd2031879229a234189b031 faketime-v0.9.6.tar.gz
-- 
2.8.1
