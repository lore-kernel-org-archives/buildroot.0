From: Kenton, Stephen M. <skenton@ou.edu>
Date: Sun, 29 Sep 2019 02:27:17 +0000
Subject: [Buildroot] [PATCH 1/1] package/udftools: bump to version 2.0.1
In-Reply-To: <20190928224053.0d505c36@windsurf>
References: <20190928070604.30849-1-fontaine.fabrice@gmail.com>
 <20190928224053.0d505c36@windsurf>
Message-ID: <D2C0CB18-A9AE-4FC9-BD34-4DE0987D581D@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you

Steve Kenton

On September 28, 2019 3:40:53 PM CDT, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

On Sat, 28 Sep 2019 09:06:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

- Drop first and third patches (already in version)
- Add two upstream patches and refresh second one so that it applies
  cleanly

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
________________________________
 ...figure-Use-AS_IF-macro-for-C99-check.patch | 27 +++++++
 ...tsetup.c-do-not-include-bits-types.h.patch | 32 --------
 ...Allow-to-build-udftools-without-udev.patch | 49 +++++++++++
 ...ect-readline-via-pkg-config-when-pos.patch | 60 --------------
 ...event-build-breakage-with-glibc-2-25.patch | 38 ---------
 ...ect-readline-via-pkg-config-when-pos.patch | 81 +++++++++++++++++++
 package/udftools/udftools.hash                |  2 +-
 package/udftools/udftools.mk                  |  2 +-
 8 files changed, 159 insertions(+), 132 deletions(-)
 create mode 100644 package/udftools/0001-configure-Use-AS_IF-macro-for-C99-check.patch
 delete mode 100644 package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch
 create mode 100644 package/udftools/0002-all-Allow-to-build-udftools-without-udev.patch
 delete mode 100644 package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch
 delete mode 100644 package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch
 create mode 100644 package/udftools/0003-configure.ac-detect-readline-via-pkg-config-when-pos.patch

Applied to master, thanks.

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190929/59f92d32/attachment.html>
