From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Thu, 16 Mar 2017 19:15:31 +0000
Subject: [Buildroot] [PATCH] xlib_libXv: correct license type
In-Reply-To: <20170316153146.21715-1-peter@korsgaard.com>
References: <20170316153146.21715-1-peter@korsgaard.com>
Message-ID: <90B0A5D74F9D1542B45328A4E51B57F0DB36CE80@PUMAIL01.pu.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

> The license is actually closer to ICS than MIT, E.G.:
> 
> https://opensource.org/licenses/ISC
> vs
> https://opensource.org/licenses/MIT
> 
> From COPYING:
> Permission to use, copy, modify, and distribute this software and its
> documentation for any purpose and without fee is hereby granted,
> provided that the above copyright notice appear in all copies and that
> both that copyright notice and this permission notice appear in
> supporting documentation, and that the names of Digital or MIT not be
> used in advertising or publicity pertaining to distribution of the
> software without specific, written prior permission.
>
> E.G.  this is the normal ICS text which has been extended with a BSD-3c
> style advertisinc clause.  Both are permissive licenses, but it is more
> correct to call it ICS-like.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/x11r7/xlib_libXv/xlib_libXv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
> index 26f8badc5..d113741e0 100644
> --- a/package/x11r7/xlib_libXv/xlib_libXv.mk
> +++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
> @@ -7,7 +7,7 @@
>  XLIB_LIBXV_VERSION = 1.0.11
>  XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
>  XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
> -XLIB_LIBXV_LICENSE = MIT
> +XLIB_LIBXV_LICENSE = ICS-like

I believe you mean ISC instead of ICS.

But to me, license for this package looks closer to OpenBSD template [1]
because of "and distribute" wording in license text. In ISC license, it's
"and/or distribute" [2]. This is just my view. May be it is better to check
with upstream what license is it?

Thanks,
Rahul

[1] - http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/share/misc/license.template?rev=HEAD
[2] - https://en.wikipedia.org/wiki/ISC_license#History
