From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Feb 2015 06:44:00 +0200
Subject: [Buildroot] [PATCH 1/1] libgc: Remove duplicated package
In-Reply-To: <1424988981-9787-1-git-send-email-paguilar@paguilar.org>
References: <1424988981-9787-1-git-send-email-paguilar@paguilar.org>
Message-ID: <20150227044400.GO2402@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pedro,

On Thu, Feb 26, 2015 at 11:16:21PM +0100, Pedro Aguilar wrote:
> Remove libgc that is a copy of bdwgc but it's not used
> by any package and gives an error when building make-4.1.
> bdwgc is a mandatory dependency for guile.

Thanks for your prompt response.

In addition to Config.in.legacy entry as Peter has mentioned, it would be nice 
to add an autobuilder reference, and a Reported-by tag. I sent v2 patch with 
these added.

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/Config.in                                  |  1 -
>  ...01-Fix-build-on-Linux-x86_64-under-uClibc.patch | 32 ----------------------
>  package/libgc/Config.in                            | 11 --------
>  package/libgc/libgc.mk                             | 15 ----------
>  4 files changed, 59 deletions(-)
>  delete mode 100644 package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
>  delete mode 100644 package/libgc/Config.in
>  delete mode 100644 package/libgc/libgc.mk

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
