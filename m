From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] heimdal: add hash file
Message-ID: <20150427211958.954DC7FD20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=827ff9e063072d2d5f25628ee6ab197676eabd45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/heimdal/heimdal.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
new file mode 100644
index 0000000..845e957
--- /dev/null
+++ b/package/heimdal/heimdal.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	aac27bedb33c341b6aed202af07ccc816146a893148721f8123abbbf93bbfea5	heimdal-1.5.3.tar.gz
