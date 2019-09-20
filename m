From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Sep 2019 13:36:48 +0200
Subject: [Buildroot] [PATCH] package/joe: license is GPL-2.0+
In-Reply-To: <20190920113003.21711-1-peter@korsgaard.com>
References: <20190920113003.21711-1-peter@korsgaard.com>
Message-ID: <CAGm1_kvyftWG87WG-Vn4whgi2jw=amS0PZoC5GHRUtV5-xQ+wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Sep 20, 2019 at 1:30 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Joe changed the COPYING file from GPL-1.0 to GPL-2.0 in the development
> leading up to 3.8:
>
> https://sourceforge.net/p/joe-editor/mercurial/ci/d731f9b3794bc4c896f2efa1c97ac2c82c3365ac/
>
> So change the license to GPL-2.0+

GPL-2.0+, GPL-2.0 etc. identifiers are deprecated [1].

What should we do? Should we switch to the new ones?

[1] https://spdx.org/licenses/GPL-2.0+.html

Yegor

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/joe/joe.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/joe/joe.mk b/package/joe/joe.mk
> index 9a3215c4e1..f0cac402e1 100644
> --- a/package/joe/joe.mk
> +++ b/package/joe/joe.mk
> @@ -6,7 +6,7 @@
>
>  JOE_VERSION = 4.6
>  JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
> -JOE_LICENSE = GPL-1.0+
> +JOE_LICENSE = GPL-2.0+
>  JOE_LICENSE_FILES = COPYING
>
>  ifeq ($(BR2_PACKAGE_NCURSES),y)
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
