From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 16:41:05 +0000
Subject: [Buildroot] [PATCH 1/3] libgtk3: rename patches to follow the new
	name structure
Message-ID: <1415637667-57658-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} |    0
 ...ck.patch => 0002-fix-introspection-check.patch} |    0
 ...-bridge.patch => 0003-disable-atk-bridge.patch} |    0
 ... 0004-Fix-undefined-reference-to-get_xkb.patch} |    0
 ...tch => 0005-do-not-build-extract-strings.patch} |    0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} (100%)
 rename package/libgtk3/{libgtk3-0002-fix-introspection-check.patch => 0002-fix-introspection-check.patch} (100%)
 rename package/libgtk3/{libgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} (100%)
 rename package/libgtk3/{libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch => 0004-Fix-undefined-reference-to-get_xkb.patch} (100%)
 rename package/libgtk3/{libgtk3-0005-do-not-build-extract-strings.patch => 0005-do-not-build-extract-strings.patch} (100%)

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
-- 
1.7.1
