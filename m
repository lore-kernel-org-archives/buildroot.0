From: Daniel Laird <danieljlaird@hotmail.com>
Date: Mon, 5 Feb 2007 01:59:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo dillo
 libgtk12 libgtk2 metacity p etc...
In-Reply-To: <20070204194743.5047748658@busybox.net>
References: <20070204194743.5047748658@busybox.net>
Message-ID: <8803519.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



aldot wrote:
> 
> Author: aldot
> Date: 2007-02-04 11:47:41 -0800 (Sun, 04 Feb 2007)
> New Revision: 17769
> 
> Log:
> - the $(XSERVER) target can be provided by different X server impls.
> Adjust users
> - rdesktop needs an xserver impl
> 
> 
> Modified:
>    trunk/buildroot/package/Makefile.in
>    trunk/buildroot/package/cairo/cairo.mk
>    trunk/buildroot/package/dillo/dillo.mk
>    trunk/buildroot/package/libgtk12/libgtk12.mk
>    trunk/buildroot/package/libgtk2/libgtk2.mk
>    trunk/buildroot/package/metacity/metacity.mk
>    trunk/buildroot/package/pango/pango.mk
>    trunk/buildroot/package/rdesktop/rdesktop.mk
>    trunk/buildroot/package/rxvt/rxvt.mk
>    trunk/buildroot/package/xorg/xorg.mk
> 
> ...
> 
Cool, I posted a thread the other day about how to deal with packages that
could be configured with X and without X(in the case where you use DirectFB
for example)
I presume we could add a DirectFB option to the list of XSERVERS: (as there
is a DirectFB Xserver)

Secondly, Would you also have anything against if XSERVERS empty then
configure packages as --without-x  (or equivalent)

Then we could also check if DirectFB then use --enable-directfb for packages
that care.

What do you think.


-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package%3A-cairo-dillo-libgtk12-libgtk2-metacity-p-etc...-tf3171054.html#a8803519
Sent from the BuildRoot mailing list archive at Nabble.com.
