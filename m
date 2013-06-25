From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 25 Jun 2013 21:57:14 +0000
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <20130625235022.75b13738@skate>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
 <20130625235022.75b13738@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639A6F98F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +	  Project home:  <http://www.nongnu.org/libunwind/index.html>
> 
> No need to indicate "Project home:", just:

Okay, I can fix that.

> 
> 	  http://www.nongnu.org/libunwind/index.html
> 
> Also:
> 
>  1) Did you check that it builds fine with uClibc? This kind of library
>  tend to use some funky C library features, sometimes not available in
>  uClibc.

Nope, I didn't.

> 
>  2) The libunwind code seems to contain some architecture-specific
>  code. While aarch64, arm, mips, ppc, sh, x86 and x86-64 are supported,
>  some other architectures that Buildroot supports are not supported. So
>  maybe this package should have a "depends on BR2_aarch64 || BR2_arm ||
>  BR2_armeb || ..."

That is possible as well.  I'm really not devoted to owning this
package that much.  I was merely attempting to push it back as I
added it to our usage of BuildRoot.  To that end, shall I abandon
the process (as I clearly am not willing to do it justice)?

It is no skin off my nose whether it gets put into BuildRoot, I was
only pushing it back as I didn't know it was there until someone else
I work with pointed out that this *seems* to be the basic library GDB
is based off of, thus could be useful in our embedded system.

Anybody willing to carry this flag for me?  I'm just not that committed
to it.

Andy
