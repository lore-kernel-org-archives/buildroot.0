From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 16:02:38 +0200
Subject: [Buildroot] [git commit] faketime: add .hash file
Message-ID: <20160616140315.942DA8210B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8de293454de61141351480526d72651ec294eff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/872/8724d7335a699e162aee5f25d8eb2e71310b5c55/
http://autobuild.buildroot.net/results/cdb/cdb6a55efa0a3d86e213aba55ddaeb52d24cf1c6/
http://autobuild.buildroot.net/results/a5f/a5f12f44a2b5d758aed5e4666897cb6eedfc1444/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/faketime/faketime.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
new file mode 100644
index 0000000..a17ef85
--- /dev/null
+++ b/package/faketime/faketime.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 56bc32006f4c5b021ff648cc1fd458c5316f40aadfd2031879229a234189b031 faketime-v0.9.6.tar.gz
