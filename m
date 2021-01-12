From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jan 2021 22:01:07 +0100
Subject: [Buildroot] [git commit] package/tar: update hash of cpio archive
Message-ID: <20210112204301.7FDB186DC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=348420039178b659bb93d3ec89c72776965a4c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 37a909cacff9 (package/tar: drop specific version for host variant)
updated the host variant from 1.29 to 1.32.

However, because there is no longer any upper-limit to the version of
tar accepted from the system, and because tests were conducted on a
recent distribution, there was no need to build the host variant of tar.

As a consequence, updating the hash file was missed.

Do so now.

Also switch to using the new two-space separators.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tar/tar.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 90beb26094..72f0cd6fcb 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256	d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8	tar-1.32.tar.xz
-sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8  tar-1.32.tar.xz
+sha256  9fbfba0cba05233421dd619b8825e1ceb7c144e433c15ae48b68f17ede8d404a  tar-1.32.cpio.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
