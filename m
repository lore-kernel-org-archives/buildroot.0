From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 19 May 2015 20:49:59 +0200
Subject: [Buildroot] [PATCH 6/6] qt5base: add patch to fix gold linker
 issue
Message-ID: <trinity-3de94631-d08e-4f79-9d49-cd96a12c36c3-1432061399031@3capp-gmx-bs29>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, May 16, 2015 at 03:31:30PM +0200, Thomas Petazzoni wrote:
> Dear Peter Korsgaard,
> 
> On Sat, 16 May 2015 15:13:44 +0200, Peter Korsgaard wrote:
> > >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> > 
> >  > The newly added patch makes sure that gold linker functionality is not
> >  > used when doing host builds, since qt5 only tests the availability of
> >  > this feature with the target compiler.
> > 
> >  > Fixes:
> > 
> >  >   http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/
> > 
> >  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > Committed, thanks. Don't forget to send the patch upstream.
> 
> I already submitted the patch as part of a bug report, which URL is
> mentioned in my Buildroot patch. However, they ask me to follow the
> entire Qt contribution process for just a one line patch, which I'm not
> sure I'm willing to do :-/
> 

If you don't mind I can (try to) submit your one line patch through
the Qt contribution process?

Regards,
Peter

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
