From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:13 +0200
Subject: [Buildroot] [git commit] sylpheed: add hash file
Message-ID: <20150728204054.298FC7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df9e6b0aaa7fe08bb9e867ca3995d6694fd874b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sylpheed/sylpheed.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
new file mode 100644
index 0000000..39c0927
--- /dev/null
+++ b/package/sylpheed/sylpheed.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	4aeb7c6436ad485a2cc101dd68a1fb84abcad4c6471ed9ddefec65e482e5b2b1	sylpheed-3.2.0.tar.bz2
