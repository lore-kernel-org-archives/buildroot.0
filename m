From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:56:58 +0200
Subject: [Buildroot] [git commit] docs/manual: Fix trivial typo
Message-ID: <20150714215703.B374C7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c99a0deec78cc0e444332c341ba687b567abd79f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index f81d625..588dbf8 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -143,7 +143,7 @@ therefore only use a few of them, or none.
 * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
   interpreter. The usage of this variable is limited to host
   packages. The two supported value are +python2+ and +python3+. It
-  will ensures the right host python package is available and will
+  will ensure the right host python package is available and will
   invoke it for the build. If some build steps are overloaded, the
   right python interpreter must be explicitly called in the commands.
 
