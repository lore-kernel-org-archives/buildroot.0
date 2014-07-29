From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:23:58 +0200
Subject: [Buildroot] [git commit] docs/manual: add sob line for patch series
Message-ID: <20140729182445.D16789D321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffc9e4680c1634fd7f2e088889c9ffbd43f4968c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -s is missing in the documentation when teaching how to use 'git
format-patch' to automatically add the sob line.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 12e7f98..b7e8944 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -272,7 +272,7 @@ This can be easily handled with +git format-patch+ by using the option
 
 ---------------------
 $ git format-patch --subject-prefix "PATCH v4" \
-    -M -o outgoing origin/master
+    -M -s -o outgoing origin/master
 ---------------------
 
 [[reporting-bugs]]
