From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 11:20:26 +0200
Subject: [Buildroot] [git commit] transmission: add hash file
Message-ID: <20150710092040.87E6E81950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd9aaf2304263236b97bb43102b55d85aaac5c34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
new file mode 100644
index 0000000..4199b37
--- /dev/null
+++ b/package/transmission/transmission.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb	transmission-2.84.tar.xz
