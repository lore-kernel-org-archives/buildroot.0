From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 19:05:56 +0200
Subject: [Buildroot] [git commit] toolchain: update paranoid unsafe path
	comment
Message-ID: <20160515170606.B628881841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9d311edc633717428376fb401e96d42ebd8738a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 919c06c28295f19ca49459b98d8954148b381360 the calls to gcc always pass
through the toolchain wrapper and all gcc patches to support poisoning has been
removed.

Update the BR2_COMPILER_PARANOID_UNSAFE_PATH comment.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index b5cc892..9bc8e51 100644
--- a/Config.in
+++ b/Config.in
@@ -694,8 +694,8 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  unsafe paths are encountered.
 
 	  Note that this mechanism is available for both the internal
-	  toolchain (through gcc and binutils patches) and external
-	  toolchain backends (through the external toolchain wrapper).
+	  toolchain (through the toolchain wrapper and binutils patches)
+	  and external toolchain backends (through the toolchain wrapper).
 
 endmenu
 
