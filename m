From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:31:14 +0200
Subject: [Buildroot] [git commit] logrotate: add hash file
Message-ID: <20150330213411.0C0A38181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38a79a4685b5ece68263f2defb0858a56bb76a1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/logrotate.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
new file mode 100644
index 0000000..ef537a9
--- /dev/null
+++ b/package/logrotate/logrotate.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 700ed7ce9072a1cca324779a74797dfaefdae37ac50a817134b947c4ded1dfa7 logrotate-3.8.9.tar.gz
