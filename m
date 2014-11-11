From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:38:52 +0100
Subject: [Buildroot] [git commit] libgtk3: rename patches to follow the new
	name structure
Message-ID: <20141111143912.255D7B40BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e6ace7d12b6991fd04bcbe7678ecff1f34f94c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} |    0
 ...ck.patch => 0002-fix-introspection-check.patch} |    0
 ...-bridge.patch => 0003-disable-atk-bridge.patch} |    0
 ... 0004-Fix-undefined-reference-to-get_xkb.patch} |    0
 ...tch => 0005-do-not-build-extract-strings.patch} |    0
 5 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0001-no-gtk-doc.patch
rename to package/libgtk3/0001-no-gtk-doc.patch
diff --git a/package/libgtk3/libgtk3-0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0002-fix-introspection-check.patch
rename to package/libgtk3/0002-fix-introspection-check.patch
diff --git a/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
rename to package/libgtk3/0003-disable-atk-bridge.patch
diff --git a/package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch b/package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch
rename to package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
diff --git a/package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch b/package/libgtk3/0005-do-not-build-extract-strings.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch
rename to package/libgtk3/0005-do-not-build-extract-strings.patch
