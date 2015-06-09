From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:04:59 +0200
Subject: [Buildroot] [git commit] package/matchbox-fakekey: add missing
	dependency
Message-ID: <20150609211052.7C89B81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17ed46a3e6b6d60b8664a4febc5f628ded043f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matchbox-fakekey build-depends on xlib_libXtst, but does not select it.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-fakekey/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
index c0cde42..97413ab 100644
--- a/package/matchbox-fakekey/Config.in
+++ b/package/matchbox-fakekey/Config.in
@@ -1,3 +1,4 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
 	bool
 	select BR2_PACKAGE_MATCHBOX_LIB
+	select BR2_PACKAGE_XLIB_LIBXTST
