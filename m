From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:50:10 +0200
Subject: [Buildroot] [git commit] erlang: fix check-package help text
	warnings
Message-ID: <20170529195027.D696B82968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01ad3a38d25af99ae29a7ffa65d8e838bfdbec03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 11407db..1cd93ca 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_ERLANG
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	help
-	  Erlang is a programming language used to build massively scalable
-	  soft real-time systems with requirements on high availability.
-	  Some of its uses are in telecoms, banking, e-commerce, computer
-	  telephony and instant messaging. Erlang's runtime system has
-	  built-in support for concurrency, distribution and fault tolerance.
+	  Erlang is a programming language used to build massively
+	  scalable soft real-time systems with requirements on high
+	  availability. Some of its uses are in telecoms, banking,
+	  e-commerce, computer telephony and instant messaging.
+	  Erlang's runtime system has built-in support for
+	  concurrency, distribution and fault tolerance.
 
 	  http://www.erlang.org
 
@@ -29,18 +30,19 @@ if BR2_PACKAGE_ERLANG
 config BR2_PACKAGE_ERLANG_SMP
 	bool "enable SMP support"
 	help
-	  Erlang provides both a UP and an SMP emulator. The UP emulator
-	  is always built, and this option enables compilation of the SMP
-	  emulator. The choice of which emulator to use is made at runtime.
-	  If you do not need SMP support, turning this option off reduces
-	  compile time and the size of the Erlang installation.
+	  Erlang provides both a UP and an SMP emulator. The UP
+	  emulator is always built, and this option enables
+	  compilation of the SMP emulator. The choice of which
+	  emulator to use is made at runtime. If you do not need SMP
+	  support, turning this option off reduces compile time and
+	  the size of the Erlang installation.
 
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
 	help
-	  The Megaco application is a framework for building applications
-	  on top of the Megaco/H.248 protocol. It is approximately 14MB in
-	  size so if you do not need it then it is recommended not to
-	  enable it.
+	  The Megaco application is a framework for building
+	  applications on top of the Megaco/H.248 protocol. It is
+	  approximately 14MB in size so if you do not need it then
+	  it is recommended not to enable it.
 
 endif # BR2_PACKAGE_ERLANG
