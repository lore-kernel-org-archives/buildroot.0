From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Apr 2010 22:33:09 +0200
Subject: [Buildroot] [git commit master] documentation: update after
	TARGET_DEVICE_TABLE removal
Message-ID: <20100418203519.B680C309B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b78722085ad0c678fca8ea5a8e39c206f66afae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index dfa69e0..abe822f 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -661,16 +661,6 @@ endif
 	<code>$(BOARD_PATH)/target_skeleton</code> so that the target
 	skeleton is stored in the board specific directory.</li>
 
-	<li><code>TARGET_DEVICE_TABLE</code> to a file that contains
-	the target device table &mdash; the list of device files (in
-	<code>/dev/</code>) to be created by the root filesystem build
-	procedure. If this variable is defined, the given device table
-	will be used instead of the default one. If defined, the
-	convention is to define it to
-	<code>$(BOARD_PATH)/target_device_table.txt</code>. See
-	<code>target/generic/device_table.txt</code> for an example
-	file.</li>
-
       </ul>
 
       </li>
-- 
1.6.3.3
