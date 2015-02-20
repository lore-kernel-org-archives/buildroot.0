From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 18:56:34 +0100
Subject: [Buildroot] [git commit] libserialport: drop untrue statement from
	Config.in help
Message-ID: <20150302222720.F11FB807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fa9de28d4a8dd5c65ee1e54b88e2d53d4e01da1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to http://sigrok.org/wiki/Libserialport:

  Note: While libserialport is hosted on sigrok.org (and sigrok
  uses libserialport), this is a completely independent library
  that can be used by other projects as well. The libserialport
  library does not depend on any sigrok related libraries or
  projects.

Drop the fragment about being a part of the sigrok suite and
extend the help text.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libserialport/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libserialport/Config.in b/package/libserialport/Config.in
index 1e2935f..d821830 100644
--- a/package/libserialport/Config.in
+++ b/package/libserialport/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_LIBSERIALPORT
 	bool "libserialport"
 	help
-	  Serial port access library.
-
-	  This library is a part of the sigrok software suite.
+	  Libserialport is a minimal, cross-platform shared
+	  library written in C that is intended to take care
+	  of the OS-specific details when writing software
+	  that uses serial ports.
 
 	  http://sigrok.org/wiki/Libserialport
