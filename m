From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:27:35 +0100
Subject: [Buildroot] [git commit] pkg-rebar: fix very minor typos in the
	comments
Message-ID: <20150219212740.0BB2481794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=235879bab5b92eddf775cb916e51334f668edd79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-rebar.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 45d1c7d..75facd5 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -74,7 +74,7 @@ endef
 # For target packages for example, one uses this to setup symbolic
 # links from $(STAGING_DIR)/usr/share/rebar/deps/<erlang-app> to
 # $(STAGING_DIR)/usr/lib/erlang/lib/<erlang-app>-<version>. This
-# infrastructure points rebar at the former in order to tell rebar do
+# infrastructure points rebar at the former in order to tell rebar to
 # NOT download dependencies during the build stage, and instead use
 # the already available dependencies.
 #
@@ -195,7 +195,7 @@ $(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
 				host-gettext host-toolchain host-erlang-rebar $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 else
-# Same deal, if _USE_BUNLDED_REBAR is NO.
+# Same deal, if _USE_BUNDLED_REBAR is NO.
 $(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain host-erlang-rebar $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
