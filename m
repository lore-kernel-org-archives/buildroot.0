From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 22:15:38 +0100
Subject: [Buildroot] [PATCH 17/36] xorg: Bump xlib_libXi version to 1.7.2
In-Reply-To: <BLU0-SMTP306E40A39A6B8F3A7866271D9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:46 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP306E40A39A6B8F3A7866271D9B50@phx.gbl>
Message-ID: <877gae3zb9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  package/x11r7/xlib_libXi/xlib_libXi.mk |    2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
 > index cac3787..4717cd0 100644
 > --- a/package/x11r7/xlib_libXi/xlib_libXi.mk
 > +++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -XLIB_LIBXI_VERSION = 1.6.1
 > +XLIB_LIBXI_VERSION = 1.7.2

It now also needs libXfixes. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
