From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:06 +0100
Subject: [Buildroot] [git commit] package/libffi: add license hash
Message-ID: <20171105163752.15C7B811E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1987f08e372604039a82869de4b6b391512bc8fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libffi/libffi.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 63a9203..0153f7e 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,2 +1,4 @@
 # From ftp://sourceware.org/pub/libffi/sha512.sum
 sha512	980ca30a8d76f963fca722432b1fe5af77d7a4e4d2eac5144fbc5374d4c596609a293440573f4294207e1bdd9fda80ad1e1cafb2ffb543df5a275bc3bd546483  libffi-3.2.1.tar.gz
+# License files, locally calculated
+sha256	0f4d7a0bfb83c37465d42dc305f124189196cc0cc2cc8d6f8461103682aebbc5  LICENSE
