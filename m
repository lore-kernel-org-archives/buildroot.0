From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:08:04 +0100
Subject: [Buildroot] [git commit] manual: Add singular example for
	dependency comment
Message-ID: <20140329080813.B66F29C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=281635630a18220a7869d47faa2af9e8bdcd32e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual always uses the format with multiple dependencies. This only
add an example where is a single dependency to show that this format is
applicable regardless of the number of dependencies.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index e56e59a..52eb653 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -202,6 +202,10 @@ for example:
 --------------------------
 aircrack-ng needs a toolchain w/ largefile, threads
 --------------------------
+or
+--------------------------
+crda needs a toolchain w/ threads
+--------------------------
 
 Note that this text is kept brief on purpose, so that it will fit on a
 80-character terminal.
