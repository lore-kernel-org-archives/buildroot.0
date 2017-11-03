From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  3 Nov 2017 14:10:53 -0700
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification process
Message-ID: <20171103211053.20886-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 docs/manual/contribute.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index a58945f395..8bbc2b9eb7 100644
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

--
2.15.0
