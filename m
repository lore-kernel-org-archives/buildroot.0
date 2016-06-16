From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:52:56 +0200
Subject: [Buildroot] [git commit] python-pyinotify: add .hash file
Message-ID: <20160616205426.CBEB981EDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f72da5cef9d57e70cfc02c174723b8a6a2880c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/35f/35f4c094a3d58b95ed990b57d91dd75f63245cc6/
http://autobuild.buildroot.org/results/0f7/0f7d666e307fc4f665bbe61cdce6c3d6838e73fa/

Similar to jquery-keyboard, it seems the python-pyinotify tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyinotify/python-pyinotify.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
new file mode 100644
index 0000000..2bcf054
--- /dev/null
+++ b/package/python-pyinotify/python-pyinotify.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
