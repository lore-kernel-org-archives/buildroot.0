From: don <don_reid@comcast.net>
Date: Sun, 14 Oct 2007 20:47:34 -0700
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <4712A78A.7090003@promwad.com>
References: <20071014200947.GA27861@reid1.localdomain>
	<4712A78A.7090003@promwad.com>
Message-ID: <20071015034734.GA15347@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 15, 2007 at 02:34:34AM +0300, Ivan Kuten wrote:
> > configure: error:
> > 
> > *** [Gentoo] sanity check failed! ***
> > *** libtool.m4 and ltmain.sh have a version mismatch! ***
> > *** (libtool.m4 = 1.5.24, ltmain.sh = "1.5.22 Debian 1.5.22-4") ***
> > 
> > Please run:
> > 
> >   libtoolize --copy --force
> > 
> 
> Have you tried to run "libtoolize --copy --force" manually?

When I tried it before I must have not been in the right directory (or had
some other problem).  This time I ran that from build_avr32/libdaemon-0.12
and then went back to the top.  The build was able to continue, thanks.

-- 
Don
