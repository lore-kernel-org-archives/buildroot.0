From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 26 Dec 2009 11:42:10 -0600
Subject: [Buildroot] gcc-error with latest buildroot
In-Reply-To: <20091226183602.0f2debb4@surf>
References: <200912261427.53159.marco-glatz@web.de>
	<20091226183602.0f2debb4@surf>
Message-ID: <200912261142.12186.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat December 26 2009, Thomas Petazzoni wrote:
> Hello,
> 
> Le Sat, 26 Dec 2009 14:27:53 +0100,
> Marco Glatz <marco-glatz@web.de> a ?crit :
> 
> > i'm trying to make a toolchain using latest buildroot, but when
> > compiling gcc i get this error:
> 
> > [/devel/buildroot/output/build/gcc-4.4.2-target/.configured] Fehler 1
> 
> Do you really need gcc on your target ?
> 

__YES__

We do after-market product development by device owners here:
http://minimodding.com
and these little MIPS boxes have more than enough resources to self-host.


> (Note: of course this is something we should fix, but having gcc and
> associated development files on the target is an unusual setup, that's
> why it isn't widely tested)
> 

Yeah, just like sstrip, fix it or mark it broken.

Mike
> Cheers,
> 
> Thomas
