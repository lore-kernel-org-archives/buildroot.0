From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Nov 2017 21:13:58 +0100
Subject: [Buildroot] [git commit] docs: update DEVELOPERS modification
 process
Message-ID: <20171105200745.0EE3A810A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8209d72211ab9b8f84ad89aa62f2b038211c32bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index a58945f..8bbc2b9 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -260,9 +260,9 @@ options that no longer exist or are no longer needed.
 
 If you are interested in getting notified of build failures and of
 further changes in the packages you added or modified, please add
-yourself to the DEVELOPERS file. This should be done in a separate
-patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
-information.
+yourself to the DEVELOPERS file. This should be done in the same patch
+creating or modifying the package. See xref:DEVELOPERS[the DEVELOPERS file]
+for more information.
 
 ==== Preparing a patch series
 
