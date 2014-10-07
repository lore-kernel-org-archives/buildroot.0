From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:30:14 +0200
Subject: [Buildroot] [git commit] gnupg: add hash file
Message-ID: <20141007103613.0FDC0B0E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62e808206db54cbcd02a62e2c982e0a932bcd15d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
new file mode 100644
index 0000000..d6733f5
--- /dev/null
+++ b/package/gnupg/gnupg.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b7b5fdda78849955e0cdbc5a085f3a08f8b7fba126c622085debb62def5d6388	gnupg-1.4.18.tar.bz2
