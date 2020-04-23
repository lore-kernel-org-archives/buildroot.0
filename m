From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:06:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: bump to version 0.0.1.38
In-Reply-To: <20200423104441.1029079-1-fontaine.fabrice@gmail.com>
References: <20200423104441.1029079-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423220615.50380e55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Apr 2020 12:44:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first and second patches (already in version)
> - Retrieve third patch from upstream
> - Retrieve an additionnal patch from upstream
> - host-gettext is needed for AM_ICONV since
>   https://github.com/linknx/linknx/commit/0512f6d0a07d50df33bfdca22d48360d164922a8
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Link-with-libiconv-if-needed.patch   | 30 ------------
>  ...nfigure-ac-tweak-CPPUNIT-conditional.patch | 47 +++++++++++++++++++
>  ...2-configure.ac-always-define-CPPUNIT.patch | 34 --------------
>  ...akefile.am-fix-linking-with-log4cpp.patch} | 14 +++---
>  package/linknx/linknx.hash                    |  4 +-
>  package/linknx/linknx.mk                      |  4 +-
>  6 files changed, 58 insertions(+), 75 deletions(-)
>  delete mode 100644 package/linknx/0001-Link-with-libiconv-if-needed.patch
>  create mode 100644 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
>  delete mode 100644 package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
>  rename package/linknx/{0003-src-Makefile.am-fix-linking-with-log4cpp.patch => 0002-src-Makefile.am-fix-linking-with-log4cpp.patch} (85%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
