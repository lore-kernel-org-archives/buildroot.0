From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:25:51 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
Message-ID: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add Qt5 support in Buildroot. I have
built a number of different combinations, but there are some many
different possibilities, that I obviously couldn't test all of
them. Some testing will be appreciated, but for sure, only the
autobuilders will really help in getting a good build coverage of all
this.

In short:

 * Patch 1 improves our pcre package to add support for 16 bits and 32
   bits variants, need by Qt5.

 * Patches 2 to 4 bump the version or add new XCB-util packages that
   are needed to build the XCB backend of Qt5.

 * Patches 5 to 7 add virtual packages for OpenGLES, OpenVG and EGL,
   and make rpi-userland provide an implementation of those virtual
   packages.

 * Patch 8 converts the jpeg virtual package to a real package.

 * Patch 9 and 10 adds some basic infrastructure to support the Qt5
   packages.

 * Patch 11 adds the Qt5Base package.

 * Patches 12 to 19 extend the Qt5Base package with various features
   (GUI, OpenSSL, EGL, D-Bus, etc.)

 * Patch 20 creates a common variable to share the Qt5 version between
   all the Qt5 packages.

 * Patches 21 to 30 add more Qt5 libraries: Qt5Svg, Qt5Webkit,
   Qt5Script, and more.

Best regards,

Thomas
