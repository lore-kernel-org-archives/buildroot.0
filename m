From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 21:45:48 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
Message-ID: <trinity-4d99cda4-12a7-4ccd-a2d9-648264125705-1426625148665@3capp-gmx-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Mar 17, 2015 at 09:29:39PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 17 Mar 2015 21:26:02 +0100, Peter Seiderer wrote:
> 
> > The only minor purpose leftover is as gcc ICE exampel for 'bfin-uclinux-gcc (ADI-2014R1-RC2) 4.3.5' (see [1])...
> 
> I don't understand, why do you say it's the "only minor purpose
> leftover" ? 
> 
> If PostgreSQL uses fork(), it *cannot* work on noMMU architecture, so
> there is no way to build PostgreSQL on Blackfin.
>

...should have added 'until Blackfin compile is disabled because of noMMU' as a footnote ;-)

But the remaining question: Revert the patch? Should I send a revert-patch?
Or can you revert/commit directly? Or leave as is?

Regards,
Peter

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
