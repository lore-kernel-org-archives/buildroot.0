From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:51:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.1.0
In-Reply-To: <20200508122110.950135-1-fontaine.fabrice@gmail.com>
References: <20200508122110.950135-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509135147.6423617e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 14:21:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Fix multiple CVEs: CVE-2020-11039, CVE-2020-11038, CVE-2020-11043,
>   CVE-2020-11040, CVE-2020-11041, CVE-2020-11019, CVE-2020-11017,
>   CVE-2020-11018
> - Fix multiple leak and crash issues (#6129, #6128, #6127, #6110, #6081,
>   #6077)
> 
> Extracted from:
> https://github.com/FreeRDP/FreeRDP/commit/65d3ff44617c5a343f726985ed45e3a0a35dfaf3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...uwac-uwac-os.c-fix-build-with-uclibc.patch | 44 -------------------
>  package/freerdp/freerdp.hash                  |  4 +-
>  package/freerdp/freerdp.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644 package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
