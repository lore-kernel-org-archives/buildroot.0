From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] sed: add hash file
Message-ID: <20150427211959.2718981941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ba33c006c18bdfd3d20ed3ff569c2f1e468d9fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sed/sed.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
new file mode 100644
index 0000000..e7f2db5
--- /dev/null
+++ b/package/sed/sed.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff	sed-4.2.2.tar.gz
