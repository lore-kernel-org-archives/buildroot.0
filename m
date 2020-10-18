From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 13:28:37 +0200
Subject: [Buildroot] [git commit] package/mksh: fix legal-info
Message-ID: <20201018112858.8D18383976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7088cca88299fb3eb9f58112b53908eb0ad2fb4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b6b5981f704f (package/mksh: update to R59b) forgot to update the
hash of mksh.1 which is used as the license file. Although the manpage
has changed to accomodate changes in mksh, the licensing blurb has not
changed.

Fixes:
 - http://autobuild.buildroot.org/results/1291917e4b17e087455a6698c4b82e4ff783600d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - expand commit log to state the license has not changed
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mksh/mksh.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 61a3acdc12..7fc34fa3e3 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
 sha256  907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6  mksh-R59b.tgz
 # Locally computed
-sha256  4655d87a53a703ead36a52f166f065c23cf58dd02d7b14abd2474f9f49383a16  mksh.1
+sha256  fb1e64c95ded58058c7f0cf5269236bc83c3cbda089cbb025b03e08f189bf47e  mksh.1
