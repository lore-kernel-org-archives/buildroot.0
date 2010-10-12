From: Maxime Ripard <ripard@archos.com>
Date: Tue, 12 Oct 2010 10:26:53 +0200
Subject: [Buildroot] [PATCH 1/4] python: Move to version 2.7
In-Reply-To: <1286872016-12621-1-git-send-email-ripard@archos.com>
References: <1286872016-12621-1-git-send-email-ripard@archos.com>
Message-ID: <1286872016-12621-2-git-send-email-ripard@archos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 package/python/python.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 8721d40..5c85c59 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -3,8 +3,8 @@
 # python
 #
 #############################################################
-PYTHON_VERSION=2.4.5
-PYTHON_VERSION_MAJOR=2.4
+PYTHON_VERSION=2.7
+PYTHON_VERSION_MAJOR=2.7
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
-- 
1.7.1


____________________________________________________________________________

This  email  and any  files  transmitted  with it are  confidential  and are
intended solely  for the use of the individual  or entity to which  they are
addressed.  Access to this e-mail by anyone else is unauthorised. If you are
not the  intended recipient,  any disclosure,  copying,  distribution or any
action taken or omitted to be taken in reliance on it, is prohibited. E-mail
messages are not necessarily secure.  Archos does not accept  responsibility
for any changes made to this message after it was sent.
