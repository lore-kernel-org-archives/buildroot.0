From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:05 +0100
Subject: [Buildroot] [PATCH 12/22] erlang-p1-xmpp: Bump to version 1.4.2
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-13-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash | 2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index e1c63a6065..5365a03241 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 699f50d50850272e67160b022fd27f3ccc46570e48968d8ee30d491bf926794d erlang-p1-xmpp-1.2.5.tar.gz
+sha256 a192349e256c0c0af46e6d7f46c52e6345e61984a266696bb0346934c434f342 erlang-p1-xmpp-1.4.2.tar.gz
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index e20a84f4a3..ced058731b 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.2.5
+ERLANG_P1_XMPP_VERSION = 1.4.2
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
