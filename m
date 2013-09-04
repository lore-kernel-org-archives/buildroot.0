From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Wed, 4 Sep 2013 13:49:26 +0200
Subject: [Buildroot] SVN process started at make
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal><87sixm558s.fsf@dell.be.48ers.dk>
 <52260E11.4090103@mind.be><15AE5A936F5E3A42A9144E66875A0A8934DB3E@server1-derijp.CLB-Benelux.lokaal><20130904100754.297bb0d6@skate><15AE5A936F5E3A42A9144E66875A0A8934DB3F@server1-derijp.CLB-Benelux.lokaal><87zjrt3q34.fsf@dell.be.48ers.dk>
 <87vc2g52gm.fsf@dell.be.48ers.dk>
Message-ID: <15AE5A936F5E3A42A9144E66875A0A8934DB45@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I did upgrade the setlocalversion from
http://git.buildroot.net/buildroot/tree/support/scripts

Tested:

user at ubuntu-ruud:~/1122-ipcan/buildroot$ make print-version
2013.02-svn84
user at ubuntu-ruud:~/1122-ipcan/buildroot$ 

So the result is OK as might be expected, with a normal delay between
the 1st and 3rd line.

Thanks,

Ruud

> -----Oorspronkelijk bericht-----
> Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
> Verzonden: woensdag 4 september 2013 12:03
> Aan: Ruud Commandeur
> CC: Thomas Petazzoni; Arnout Vandecappelle; buildroot at uclibc.org
> Onderwerp: Re: SVN process started at make
> 
> >>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:
> 
>  Peter> Ok, I'm afraid there's not much to do about svn being crap :/
> 
>  Peter> How come you are only seeing this now? We've been calling
>  Peter> setlocalversion since 2010. Did you recently upgrade 
> your svn version?
> 
>  Peter> Looking at the kernel history (where setlocalversion 
> comes from), I see
>  Peter> a commit from Mike Frysinger where the svn status 
> step is skipped as it
>  Peter> was deemed too slow, so perhaps we should just resync our
>  Peter> setlocalversion script with the kernel:
> 
>  Peter> I'll do that now.
> 
> It is now in git. Could you give it a test please?
> 
> -- 
> Bye, Peter Korsgaard
> 
