From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 09:30:47 +0200
Subject: [Buildroot] [git commit] atftp: add hash file
Message-ID: <20141006073136.35729B0B83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ee023be2f064519faedc5deb2987a5ef5dabdf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a hash file will allow autobuilders to detect that the files
they have downloaded is invalid. It will be removed, and then
re-downloaded in a followup build.

Should fix issues such as:

  http://autobuild.buildroot.org/results/939/93963514fc42d481808b1a046f3e1376286bdae2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atftp/atftp.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
new file mode 100644
index 0000000..b7860c7
--- /dev/null
+++ b/package/atftp/atftp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha1 fc9e9f821dfd2f257b4a5c32b948ed60b4e31fd1 atftp-0.7.1.tar.gz
