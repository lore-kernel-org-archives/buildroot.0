Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D43E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5ED83D26;
	Sat, 30 Sep 2023 08:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B5ED83D26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjkdsO8YyFUT; Sat, 30 Sep 2023 08:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8320383D37;
	Sat, 30 Sep 2023 08:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8320383D37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 996A21BF2CE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713D260F84
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 713D260F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_V3xM19jLgU for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:59:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50FE660BB2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50FE660BB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B146838A7; Sat, 30 Sep 2023 08:59:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 10:25:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1f9c511626e2a91f99ed6113ff29a504a717711
X-Git-Newrev: 32cec3be9766498f472fd463aaff00f4e7ad554d
X-Patchwork-Hint: ignore
Message-Id: <20230930085915.3B146838A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: rename *.txt as *.adoc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32cec3be9766498f472fd463aaff00f4e7ad554d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

by using this standard extension `adoc`,
these files are rendered on gitlab & github

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...board-support.txt => adding-board-support.adoc} |  0
 ...-asciidoc.txt => adding-packages-asciidoc.adoc} |  0
 ...utotools.txt => adding-packages-autotools.adoc} |  0
 ...ckages-cargo.txt => adding-packages-cargo.adoc} |  0
 ...ckages-cmake.txt => adding-packages-cmake.adoc} |  0
 ...clusion.txt => adding-packages-conclusion.adoc} |  0
 ...irectory.txt => adding-packages-directory.adoc} |  0
 ...es-generic.txt => adding-packages-generic.adoc} |  0
 ...es-gettext.txt => adding-packages-gettext.adoc} |  0
 ...ages-golang.txt => adding-packages-golang.adoc} |  0
 ...ckages-hooks.txt => adding-packages-hooks.adoc} |  0
 ...es-kconfig.txt => adding-packages-kconfig.adoc} |  0
 ...dule.txt => adding-packages-kernel-module.adoc} |  0
 ...> adding-packages-linux-kernel-spec-infra.adoc} |  0
 ...-luarocks.txt => adding-packages-luarocks.adoc} |  0
 ...ckages-meson.txt => adding-packages-meson.adoc} |  0
 ...packages-perl.txt => adding-packages-perl.adoc} |  0
 ...ages-python.txt => adding-packages-python.adoc} |  0
 ...ckages-qmake.txt => adding-packages-qmake.adoc} |  0
 ...ckages-rebar.txt => adding-packages-rebar.adoc} |  0
 ...packages-tips.txt => adding-packages-tips.adoc} |  0
 ...es-virtual.txt => adding-packages-virtual.adoc} |  0
 ...g-packages-waf.txt => adding-packages-waf.adoc} |  0
 docs/manual/adding-packages.adoc                   | 58 +++++++++++++++++
 docs/manual/adding-packages.txt                    | 58 -----------------
 docs/manual/advanced.adoc                          | 16 +++++
 docs/manual/advanced.txt                           | 16 -----
 docs/manual/appendix.adoc                          |  6 ++
 docs/manual/appendix.txt                           |  6 --
 ...{beyond-buildroot.txt => beyond-buildroot.adoc} |  0
 .../{ccache-support.txt => ccache-support.adoc}    |  0
 .../manual/{common-usage.txt => common-usage.adoc} |  6 +-
 ...ponents.txt => configure-other-components.adoc} |  0
 docs/manual/{configure.txt => configure.adoc}      |  0
 docs/manual/{contribute.txt => contribute.adoc}    |  0
 ...figuration.txt => customize-configuration.adoc} |  0
 ...txt => customize-device-permission-tables.adoc} |  0
 ...ture.txt => customize-directory-structure.adoc} |  0
 ...ze-outside-br.txt => customize-outside-br.adoc} |  0
 ...tomize-packages.txt => customize-packages.adoc} |  0
 ...ustomize-patches.txt => customize-patches.adoc} |  0
 ...ze-post-image.txt => customize-post-image.adoc} |  0
 ...-quick-guide.txt => customize-quick-guide.adoc} |  0
 ...{customize-rootfs.txt => customize-rootfs.adoc} |  2 +-
 ...sers-tables.txt => customize-users-tables.adoc} |  0
 docs/manual/{customize.txt => customize.adoc}      | 18 +++---
 ...ging-buildroot.txt => debugging-buildroot.adoc} |  0
 docs/manual/{developers.txt => developers.adoc}    |  0
 .../{download-infra.txt => download-infra.adoc}    |  0
 ...ownload-location.txt => download-location.adoc} |  0
 ...roubleshooting.txt => faq-troubleshooting.adoc} |  0
 docs/manual/{getting.txt => getting.adoc}          |  0
 ...uildroot-works.txt => how-buildroot-works.adoc} |  0
 ...upport.txt => integration-selinux-support.adoc} |  0
 ...ration-systemd.txt => integration-systemd.adoc} |  0
 docs/manual/{integration.txt => integration.adoc}  |  4 +-
 .../manual/{introduction.txt => introduction.adoc} |  0
 .../manual/{known-issues.txt => known-issues.adoc} |  0
 .../manual/{legal-notice.txt => legal-notice.adoc} |  0
 docs/manual/{make-tips.txt => make-tips.adoc}      |  0
 .../{makedev-syntax.txt => makedev-syntax.adoc}    |  0
 ...{makeusers-syntax.txt => makeusers-syntax.adoc} |  0
 docs/manual/manual.adoc                            | 75 ++++++++++++++++++++++
 docs/manual/manual.mk                              |  2 +-
 docs/manual/manual.txt                             | 75 ----------------------
 docs/manual/{migrating.txt => migrating.adoc}      |  0
 ...ge-make-target.txt => package-make-target.adoc} |  0
 .../manual/{patch-policy.txt => patch-policy.adoc} |  0
 .../manual/{prerequisite.txt => prerequisite.adoc} |  0
 docs/manual/{quickstart.txt => quickstart.adoc}    |  0
 ...lding-packages.txt => rebuilding-packages.adoc} |  0
 ...se-engineering.txt => release-engineering.adoc} |  0
 docs/manual/{resources.txt => resources.adoc}      |  0
 ...-debugger.txt => using-buildroot-debugger.adoc} |  0
 ...opment.txt => using-buildroot-development.adoc} |  0
 ...oolchain.txt => using-buildroot-toolchain.adoc} |  0
 .../{writing-rules.txt => writing-rules.adoc}      |  0
 package/doc-asciidoc.mk                            |  2 +-
 78 files changed, 172 insertions(+), 172 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.adoc
similarity index 100%
rename from docs/manual/adding-board-support.txt
rename to docs/manual/adding-board-support.adoc
diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.adoc
similarity index 100%
rename from docs/manual/adding-packages-asciidoc.txt
rename to docs/manual/adding-packages-asciidoc.adoc
diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.adoc
similarity index 100%
rename from docs/manual/adding-packages-autotools.txt
rename to docs/manual/adding-packages-autotools.adoc
diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.adoc
similarity index 100%
rename from docs/manual/adding-packages-cargo.txt
rename to docs/manual/adding-packages-cargo.adoc
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.adoc
similarity index 100%
rename from docs/manual/adding-packages-cmake.txt
rename to docs/manual/adding-packages-cmake.adoc
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.adoc
similarity index 100%
rename from docs/manual/adding-packages-conclusion.txt
rename to docs/manual/adding-packages-conclusion.adoc
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.adoc
similarity index 100%
rename from docs/manual/adding-packages-directory.txt
rename to docs/manual/adding-packages-directory.adoc
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.adoc
similarity index 100%
rename from docs/manual/adding-packages-generic.txt
rename to docs/manual/adding-packages-generic.adoc
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.adoc
similarity index 100%
rename from docs/manual/adding-packages-gettext.txt
rename to docs/manual/adding-packages-gettext.adoc
diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.adoc
similarity index 100%
rename from docs/manual/adding-packages-golang.txt
rename to docs/manual/adding-packages-golang.adoc
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.adoc
similarity index 100%
rename from docs/manual/adding-packages-hooks.txt
rename to docs/manual/adding-packages-hooks.adoc
diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.adoc
similarity index 100%
rename from docs/manual/adding-packages-kconfig.txt
rename to docs/manual/adding-packages-kconfig.adoc
diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.adoc
similarity index 100%
rename from docs/manual/adding-packages-kernel-module.txt
rename to docs/manual/adding-packages-kernel-module.adoc
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.txt b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
similarity index 100%
rename from docs/manual/adding-packages-linux-kernel-spec-infra.txt
rename to docs/manual/adding-packages-linux-kernel-spec-infra.adoc
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.adoc
similarity index 100%
rename from docs/manual/adding-packages-luarocks.txt
rename to docs/manual/adding-packages-luarocks.adoc
diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.adoc
similarity index 100%
rename from docs/manual/adding-packages-meson.txt
rename to docs/manual/adding-packages-meson.adoc
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.adoc
similarity index 100%
rename from docs/manual/adding-packages-perl.txt
rename to docs/manual/adding-packages-perl.adoc
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.adoc
similarity index 100%
rename from docs/manual/adding-packages-python.txt
rename to docs/manual/adding-packages-python.adoc
diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.adoc
similarity index 100%
rename from docs/manual/adding-packages-qmake.txt
rename to docs/manual/adding-packages-qmake.adoc
diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.adoc
similarity index 100%
rename from docs/manual/adding-packages-rebar.txt
rename to docs/manual/adding-packages-rebar.adoc
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.adoc
similarity index 100%
rename from docs/manual/adding-packages-tips.txt
rename to docs/manual/adding-packages-tips.adoc
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.adoc
similarity index 100%
rename from docs/manual/adding-packages-virtual.txt
rename to docs/manual/adding-packages-virtual.adoc
diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.adoc
similarity index 100%
rename from docs/manual/adding-packages-waf.txt
rename to docs/manual/adding-packages-waf.adoc
diff --git a/docs/manual/adding-packages.adoc b/docs/manual/adding-packages.adoc
new file mode 100644
index 0000000000..10acae0b1a
--- /dev/null
+++ b/docs/manual/adding-packages.adoc
@@ -0,0 +1,58 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[adding-packages]]
+== Adding new packages to Buildroot
+
+This section covers how new packages (userspace libraries or
+applications) can be integrated into Buildroot. It also shows how
+existing packages are integrated, which is needed for fixing issues or
+tuning their configuration.
+
+When you add a new package, be sure to test it in various conditions
+(see xref:testing-package[]) and also check it for coding style (see
+xref:check-package[]).
+
+include::adding-packages-directory.adoc[]
+
+include::adding-packages-generic.adoc[]
+
+include::adding-packages-autotools.adoc[]
+
+include::adding-packages-cmake.adoc[]
+
+include::adding-packages-python.adoc[]
+
+include::adding-packages-luarocks.adoc[]
+
+include::adding-packages-perl.adoc[]
+
+include::adding-packages-virtual.adoc[]
+
+include::adding-packages-kconfig.adoc[]
+
+include::adding-packages-rebar.adoc[]
+
+include::adding-packages-waf.adoc[]
+
+include::adding-packages-meson.adoc[]
+
+include::adding-packages-cargo.adoc[]
+
+include::adding-packages-golang.adoc[]
+
+include::adding-packages-qmake.adoc[]
+
+include::adding-packages-kernel-module.adoc[]
+
+include::adding-packages-asciidoc.adoc[]
+
+include::adding-packages-linux-kernel-spec-infra.adoc[]
+
+include::adding-packages-hooks.adoc[]
+
+include::adding-packages-gettext.adoc[]
+
+include::adding-packages-tips.adoc[]
+
+include::adding-packages-conclusion.adoc[]
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
deleted file mode 100644
index 814355cd76..0000000000
--- a/docs/manual/adding-packages.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-[[adding-packages]]
-== Adding new packages to Buildroot
-
-This section covers how new packages (userspace libraries or
-applications) can be integrated into Buildroot. It also shows how
-existing packages are integrated, which is needed for fixing issues or
-tuning their configuration.
-
-When you add a new package, be sure to test it in various conditions
-(see xref:testing-package[]) and also check it for coding style (see
-xref:check-package[]).
-
-include::adding-packages-directory.txt[]
-
-include::adding-packages-generic.txt[]
-
-include::adding-packages-autotools.txt[]
-
-include::adding-packages-cmake.txt[]
-
-include::adding-packages-python.txt[]
-
-include::adding-packages-luarocks.txt[]
-
-include::adding-packages-perl.txt[]
-
-include::adding-packages-virtual.txt[]
-
-include::adding-packages-kconfig.txt[]
-
-include::adding-packages-rebar.txt[]
-
-include::adding-packages-waf.txt[]
-
-include::adding-packages-meson.txt[]
-
-include::adding-packages-cargo.txt[]
-
-include::adding-packages-golang.txt[]
-
-include::adding-packages-qmake.txt[]
-
-include::adding-packages-kernel-module.txt[]
-
-include::adding-packages-asciidoc.txt[]
-
-include::adding-packages-linux-kernel-spec-infra.txt[]
-
-include::adding-packages-hooks.txt[]
-
-include::adding-packages-gettext.txt[]
-
-include::adding-packages-tips.txt[]
-
-include::adding-packages-conclusion.txt[]
diff --git a/docs/manual/advanced.adoc b/docs/manual/advanced.adoc
new file mode 100644
index 0000000000..7f650e6689
--- /dev/null
+++ b/docs/manual/advanced.adoc
@@ -0,0 +1,16 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Advanced usage
+
+include::using-buildroot-toolchain.adoc[]
+
+include::using-buildroot-debugger.adoc[]
+
+include::ccache-support.adoc[]
+
+include::download-location.adoc[]
+
+include::package-make-target.adoc[]
+
+include::using-buildroot-development.adoc[]
diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
deleted file mode 100644
index b7bfc4923d..0000000000
--- a/docs/manual/advanced.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-=== Advanced usage
-
-include::using-buildroot-toolchain.txt[]
-
-include::using-buildroot-debugger.txt[]
-
-include::ccache-support.txt[]
-
-include::download-location.txt[]
-
-include::package-make-target.txt[]
-
-include::using-buildroot-development.txt[]
diff --git a/docs/manual/appendix.adoc b/docs/manual/appendix.adoc
new file mode 100644
index 0000000000..4eece71672
--- /dev/null
+++ b/docs/manual/appendix.adoc
@@ -0,0 +1,6 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+include::makedev-syntax.adoc[]
+include::makeusers-syntax.adoc[]
+include::migrating.adoc[]
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
deleted file mode 100644
index 86afa4bdaa..0000000000
--- a/docs/manual/appendix.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-include::makedev-syntax.txt[]
-include::makeusers-syntax.txt[]
-include::migrating.txt[]
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.adoc
similarity index 100%
rename from docs/manual/beyond-buildroot.txt
rename to docs/manual/beyond-buildroot.adoc
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.adoc
similarity index 100%
rename from docs/manual/ccache-support.txt
rename to docs/manual/ccache-support.adoc
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.adoc
similarity index 99%
rename from docs/manual/common-usage.txt
rename to docs/manual/common-usage.adoc
index bc78f4a871..e0ab1a9f66 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.adoc
@@ -3,9 +3,9 @@
 
 == General Buildroot usage
 
-include::make-tips.txt[]
+include::make-tips.adoc[]
 
-include::rebuilding-packages.txt[]
+include::rebuilding-packages.adoc[]
 
 === Offline builds
 
@@ -417,4 +417,4 @@ effects:
   be empty and it's only at the very end of the build that they will
   be populated.
 
-include::advanced.txt[]
+include::advanced.adoc[]
diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.adoc
similarity index 100%
rename from docs/manual/configure-other-components.txt
rename to docs/manual/configure-other-components.adoc
diff --git a/docs/manual/configure.txt b/docs/manual/configure.adoc
similarity index 100%
rename from docs/manual/configure.txt
rename to docs/manual/configure.adoc
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.adoc
similarity index 100%
rename from docs/manual/contribute.txt
rename to docs/manual/contribute.adoc
diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.adoc
similarity index 100%
rename from docs/manual/customize-configuration.txt
rename to docs/manual/customize-configuration.adoc
diff --git a/docs/manual/customize-device-permission-tables.txt b/docs/manual/customize-device-permission-tables.adoc
similarity index 100%
rename from docs/manual/customize-device-permission-tables.txt
rename to docs/manual/customize-device-permission-tables.adoc
diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.adoc
similarity index 100%
rename from docs/manual/customize-directory-structure.txt
rename to docs/manual/customize-directory-structure.adoc
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.adoc
similarity index 100%
rename from docs/manual/customize-outside-br.txt
rename to docs/manual/customize-outside-br.adoc
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.adoc
similarity index 100%
rename from docs/manual/customize-packages.txt
rename to docs/manual/customize-packages.adoc
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.adoc
similarity index 100%
rename from docs/manual/customize-patches.txt
rename to docs/manual/customize-patches.adoc
diff --git a/docs/manual/customize-post-image.txt b/docs/manual/customize-post-image.adoc
similarity index 100%
rename from docs/manual/customize-post-image.txt
rename to docs/manual/customize-post-image.adoc
diff --git a/docs/manual/customize-quick-guide.txt b/docs/manual/customize-quick-guide.adoc
similarity index 100%
rename from docs/manual/customize-quick-guide.txt
rename to docs/manual/customize-quick-guide.adoc
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.adoc
similarity index 99%
rename from docs/manual/customize-rootfs.txt
rename to docs/manual/customize-rootfs.adoc
index e46306fd2a..d5d8b9288f 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.adoc
@@ -153,4 +153,4 @@ Using `fakeroot` is not an absolute substitute for actually being root.
   `fakeroot` only ever fakes the file access rights and types (regular,
   block-or-char device...) and uid/gid; these are emulated in-memory.
 
-include::customize-device-permission-tables.txt[]
+include::customize-device-permission-tables.adoc[]
diff --git a/docs/manual/customize-users-tables.txt b/docs/manual/customize-users-tables.adoc
similarity index 100%
rename from docs/manual/customize-users-tables.txt
rename to docs/manual/customize-users-tables.adoc
diff --git a/docs/manual/customize.txt b/docs/manual/customize.adoc
similarity index 85%
rename from docs/manual/customize.txt
rename to docs/manual/customize.adoc
index 484413e4d8..23fad7ba11 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.adoc
@@ -41,20 +41,20 @@ image in a reproducible way, even after running 'make clean'. By
 following the recommended strategy, you can even use the same Buildroot
 tree to build multiple distinct projects!
 
-include::customize-directory-structure.txt[]
+include::customize-directory-structure.adoc[]
 
-include::customize-outside-br.txt[]
+include::customize-outside-br.adoc[]
 
-include::customize-configuration.txt[]
+include::customize-configuration.adoc[]
 
-include::customize-rootfs.txt[]
+include::customize-rootfs.adoc[]
 
-include::customize-users-tables.txt[]
+include::customize-users-tables.adoc[]
 
-include::customize-post-image.txt[]
+include::customize-post-image.adoc[]
 
-include::customize-patches.txt[]
+include::customize-patches.adoc[]
 
-include::customize-packages.txt[]
+include::customize-packages.adoc[]
 
-include::customize-quick-guide.txt[]
+include::customize-quick-guide.adoc[]
diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.adoc
similarity index 100%
rename from docs/manual/debugging-buildroot.txt
rename to docs/manual/debugging-buildroot.adoc
diff --git a/docs/manual/developers.txt b/docs/manual/developers.adoc
similarity index 100%
rename from docs/manual/developers.txt
rename to docs/manual/developers.adoc
diff --git a/docs/manual/download-infra.txt b/docs/manual/download-infra.adoc
similarity index 100%
rename from docs/manual/download-infra.txt
rename to docs/manual/download-infra.adoc
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.adoc
similarity index 100%
rename from docs/manual/download-location.txt
rename to docs/manual/download-location.adoc
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.adoc
similarity index 100%
rename from docs/manual/faq-troubleshooting.txt
rename to docs/manual/faq-troubleshooting.adoc
diff --git a/docs/manual/getting.txt b/docs/manual/getting.adoc
similarity index 100%
rename from docs/manual/getting.txt
rename to docs/manual/getting.adoc
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.adoc
similarity index 100%
rename from docs/manual/how-buildroot-works.txt
rename to docs/manual/how-buildroot-works.adoc
diff --git a/docs/manual/integration-selinux-support.txt b/docs/manual/integration-selinux-support.adoc
similarity index 100%
rename from docs/manual/integration-selinux-support.txt
rename to docs/manual/integration-selinux-support.adoc
diff --git a/docs/manual/integration-systemd.txt b/docs/manual/integration-systemd.adoc
similarity index 100%
rename from docs/manual/integration-systemd.txt
rename to docs/manual/integration-systemd.adoc
diff --git a/docs/manual/integration.txt b/docs/manual/integration.adoc
similarity index 80%
rename from docs/manual/integration.txt
rename to docs/manual/integration.adoc
index be56bf6567..1626dd75dd 100644
--- a/docs/manual/integration.txt
+++ b/docs/manual/integration.adoc
@@ -9,6 +9,6 @@ level. Buildroot is highly configurable, almost everything discussed
 here can be changed or overridden by xref:rootfs-custom[rootfs overlay
 or custom skeleton] configuration.
 
-include::integration-systemd.txt[]
+include::integration-systemd.adoc[]
 
-include::integration-selinux-support.txt[]
+include::integration-selinux-support.adoc[]
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.adoc
similarity index 100%
rename from docs/manual/introduction.txt
rename to docs/manual/introduction.adoc
diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.adoc
similarity index 100%
rename from docs/manual/known-issues.txt
rename to docs/manual/known-issues.adoc
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.adoc
similarity index 100%
rename from docs/manual/legal-notice.txt
rename to docs/manual/legal-notice.adoc
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.adoc
similarity index 100%
rename from docs/manual/make-tips.txt
rename to docs/manual/make-tips.adoc
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.adoc
similarity index 100%
rename from docs/manual/makedev-syntax.txt
rename to docs/manual/makedev-syntax.adoc
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.adoc
similarity index 100%
rename from docs/manual/makeusers-syntax.txt
rename to docs/manual/makeusers-syntax.adoc
diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
new file mode 100644
index 0000000000..31d5f80bae
--- /dev/null
+++ b/docs/manual/manual.adoc
@@ -0,0 +1,75 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+= The Buildroot user manual
+:toc:
+
+Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
+{localtime} from git revision {sys:git rev-parse --short HEAD}
+
+The Buildroot manual is written by the Buildroot developers.
+It is licensed under the GNU General Public License, version 2. Refer to the
+http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
+file in the Buildroot sources for the full text of this license.
+
+Copyright (C) The Buildroot developers <buildroot@buildroot.org>
+
+image::logo.png[]
+
+= Getting started
+
+include::introduction.adoc[]
+
+include::prerequisite.adoc[]
+
+include::getting.adoc[]
+
+include::quickstart.adoc[]
+
+include::resources.adoc[]
+
+= User guide
+
+include::configure.adoc[]
+
+include::configure-other-components.adoc[]
+
+include::common-usage.adoc[]
+
+include::customize.adoc[]
+
+include::integration.adoc[]
+
+include::faq-troubleshooting.adoc[]
+
+include::known-issues.adoc[]
+
+include::legal-notice.adoc[]
+
+include::beyond-buildroot.adoc[]
+
+= Developer guide
+
+include::how-buildroot-works.adoc[]
+
+include::writing-rules.adoc[]
+
+include::adding-board-support.adoc[]
+
+include::adding-packages.adoc[]
+
+include::patch-policy.adoc[]
+
+include::download-infra.adoc[]
+
+include::debugging-buildroot.adoc[]
+
+include::contribute.adoc[]
+
+include::developers.adoc[]
+
+include::release-engineering.adoc[]
+
+= Appendix
+
+include::appendix.adoc[]
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 1d03b213db..e851a084ae 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
+MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.adoc) $(wildcard docs/images/*))
 MANUAL_RESOURCES = $(TOPDIR)/docs/images
 
 $(eval $(call asciidoc-document))
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
deleted file mode 100644
index d6534ca295..0000000000
--- a/docs/manual/manual.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-= The Buildroot user manual
-:toc:
-
-Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
-{localtime} from git revision {sys:git rev-parse --short HEAD}
-
-The Buildroot manual is written by the Buildroot developers.
-It is licensed under the GNU General Public License, version 2. Refer to the
-http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
-file in the Buildroot sources for the full text of this license.
-
-Copyright (C) The Buildroot developers <buildroot@buildroot.org>
-
-image::logo.png[]
-
-= Getting started
-
-include::introduction.txt[]
-
-include::prerequisite.txt[]
-
-include::getting.txt[]
-
-include::quickstart.txt[]
-
-include::resources.txt[]
-
-= User guide
-
-include::configure.txt[]
-
-include::configure-other-components.txt[]
-
-include::common-usage.txt[]
-
-include::customize.txt[]
-
-include::integration.txt[]
-
-include::faq-troubleshooting.txt[]
-
-include::known-issues.txt[]
-
-include::legal-notice.txt[]
-
-include::beyond-buildroot.txt[]
-
-= Developer guide
-
-include::how-buildroot-works.txt[]
-
-include::writing-rules.txt[]
-
-include::adding-board-support.txt[]
-
-include::adding-packages.txt[]
-
-include::patch-policy.txt[]
-
-include::download-infra.txt[]
-
-include::debugging-buildroot.txt[]
-
-include::contribute.txt[]
-
-include::developers.txt[]
-
-include::release-engineering.txt[]
-
-= Appendix
-
-include::appendix.txt[]
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.adoc
similarity index 100%
rename from docs/manual/migrating.txt
rename to docs/manual/migrating.adoc
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.adoc
similarity index 100%
rename from docs/manual/package-make-target.txt
rename to docs/manual/package-make-target.adoc
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.adoc
similarity index 100%
rename from docs/manual/patch-policy.txt
rename to docs/manual/patch-policy.adoc
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.adoc
similarity index 100%
rename from docs/manual/prerequisite.txt
rename to docs/manual/prerequisite.adoc
diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.adoc
similarity index 100%
rename from docs/manual/quickstart.txt
rename to docs/manual/quickstart.adoc
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.adoc
similarity index 100%
rename from docs/manual/rebuilding-packages.txt
rename to docs/manual/rebuilding-packages.adoc
diff --git a/docs/manual/release-engineering.txt b/docs/manual/release-engineering.adoc
similarity index 100%
rename from docs/manual/release-engineering.txt
rename to docs/manual/release-engineering.adoc
diff --git a/docs/manual/resources.txt b/docs/manual/resources.adoc
similarity index 100%
rename from docs/manual/resources.txt
rename to docs/manual/resources.adoc
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.adoc
similarity index 100%
rename from docs/manual/using-buildroot-debugger.txt
rename to docs/manual/using-buildroot-debugger.adoc
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.adoc
similarity index 100%
rename from docs/manual/using-buildroot-development.txt
rename to docs/manual/using-buildroot-development.adoc
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.adoc
similarity index 100%
rename from docs/manual/using-buildroot-toolchain.txt
rename to docs/manual/using-buildroot-toolchain.adoc
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.adoc
similarity index 100%
rename from docs/manual/writing-rules.txt
rename to docs/manual/writing-rules.adoc
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 6b8eaa81b3..40c9a725d1 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -124,7 +124,7 @@ $$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
 			--resource="$$(abspath $$(r))") \
 		$$($(2)_$(3)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
-		$$(BUILD_DIR)/docs/$(1)/$(1).txt
+		$$(BUILD_DIR)/docs/$(1)/$(1).adoc
 # install the generated document
 	$$($(2)_$(3)_INSTALL_CMDS)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
