From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:53:55 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1
In-Reply-To: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
References: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
Message-ID: <20171122215355.0f592ad2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Nov 2017 15:26:41 +0100, Fabrice Fontaine wrote:
> - Remove 0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch,
> it does not have been sent upstream but issue has been fixed by
> https://github.com/Motion-Project/motion/commit/3b7164f7f9c2b123f850f8cd1bc0a860ca51c0fe#diff-67e997bcfdac55191033d57a16d1408a
> - 0002-Rename-base64_encode.patch has been integrated into this version
> - --without-jpeg-turbo has been deleted from configure.ac
> - libsdl dependency has been removed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch |  31 ------
>  package/motion/0002-Rename-base64_encode.patch     | 116 ---------------------
>  package/motion/motion.hash                         |   3 +-
>  package/motion/motion.mk                           |  22 +---
>  4 files changed, 5 insertions(+), 167 deletions(-)
>  delete mode 100644 package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
>  delete mode 100644 package/motion/0002-Rename-base64_encode.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
