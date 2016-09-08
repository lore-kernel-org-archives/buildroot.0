From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 19:50:19 +0200
Subject: [Buildroot] [git commit] erlang-rebar: bump to version 2.6.4
Message-ID: <20160908175037.19509818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=866722daaa32dd57215c8b8f3e6fdb1df120174c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang-rebar/erlang-rebar.hash | 2 +-
 package/erlang-rebar/erlang-rebar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-rebar/erlang-rebar.hash b/package/erlang-rebar/erlang-rebar.hash
index 029b52c..27cc91a 100644
--- a/package/erlang-rebar/erlang-rebar.hash
+++ b/package/erlang-rebar/erlang-rebar.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 aed933d4e60c4f11e0771ccdb4434cccdb9a71cf8b1363d17aaf863988b3ff60 erlang-rebar-2.6.1.tar.gz
+sha256 577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07 erlang-rebar-2.6.4.tar.gz
diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index 61904cc..031ff47 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_REBAR_VERSION = 2.6.1
+ERLANG_REBAR_VERSION = 2.6.4
 
 # Upstream publishes a release, but we can not use it as it is a release of
 # a generated rebar script, when we want the sources. So we have to use the
