From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:19:36 +0100
Subject: [Buildroot] [git commit] localedef: add a hash file
Message-ID: <20151126212822.E80D081683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac43476f544edf4d3c551c5fa6e44fbe2b97ce64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/localedef/localedef.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
new file mode 100644
index 0000000..ee14fb1
--- /dev/null
+++ b/package/localedef/localedef.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9a60f7cdab6fb39adf23a12102f2d950d5f07f0cd7e51e85ec327e07440a79c6  localedef-eglibc-2.14.1-r17443-ptx1.tar.bz2
