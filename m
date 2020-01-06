From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:02 +0100
Subject: [Buildroot] [PATCH 09/22] ejabberd-p1-stun: Bump to version 1.0.29
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-10-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index 7400a276a0..736ac48e38 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a5a59ae3c75290029aa062ef19ecd52b8377959a8eb7352bd2a62c4ff1dd0613 erlang-p1-stun-1.0.25.tar.gz
+sha256 87cfd9d75c7b956b4c26c9e94492737a4528abf4b09f4f7d89a40abaa0dc088a erlang-p1-stun-1.0.29.tar.gz
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 32bdd4f245..ff2899ffbe 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.25
+ERLANG_P1_STUN_VERSION = 1.0.29
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
