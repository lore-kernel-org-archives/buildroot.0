From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:10 +0200
Subject: [Buildroot] [git commit] ortp: add hash file
Message-ID: <20150728204048.8F4EC81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9f8688ac43a4bbe40ead6676d4526745ac10940
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ortp/ortp.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
new file mode 100644
index 0000000..728a0d1
--- /dev/null
+++ b/package/ortp/ortp.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	6e37e29b3c3559bac1f2ae0c977f6ceb4d4ce8dc713b691dea8bae57bda92d0b	ortp-0.22.0.tar.gz
