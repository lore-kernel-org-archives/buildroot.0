From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Nov 2014 11:15:20 +0000
Subject: [Buildroot] [PATCH v2 0/2] libgtk3: version bump
Message-ID: <1415704522-14201-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v1:
- Join patches 2 and 3 in a single one, so the patch series works at 
  each point of the series.
- Add a hash file

Vicente Olivert Riera (2):
  libgtk3: rename patches to follow the new name structure
  libgtk3: bump version to 3.14.5

 ...0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} |    0
 ...ck.patch => 0002-fix-introspection-check.patch} |    0
 ...-bridge.patch => 0003-disable-atk-bridge.patch} |    0
 ... 0004-Fix-undefined-reference-to-get_xkb.patch} |    0
 ...tch => 0005-do-not-build-extract-strings.patch} |    0
 ...lug-is-conditionally-supported-on-X11-onl.patch |   57 ++++++++++++++++++++
 package/libgtk3/libgtk3.hash                       |    2 +
 package/libgtk3/libgtk3.mk                         |    2 +-
 8 files changed, 60 insertions(+), 1 deletions(-)
 rename package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} (100%)
 rename package/libgtk3/{libgtk3-0002-fix-introspection-check.patch => 0002-fix-introspection-check.patch} (100%)
 rename package/libgtk3/{libgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} (100%)
 rename package/libgtk3/{libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch => 0004-Fix-undefined-reference-to-get_xkb.patch} (100%)
 rename package/libgtk3/{libgtk3-0005-do-not-build-extract-strings.patch => 0005-do-not-build-extract-strings.patch} (100%)
 create mode 100644 package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch
 create mode 100644 package/libgtk3/libgtk3.hash
