From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 22:25:48 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: slightly improve faq entry
 about compiler on target
In-Reply-To: <20141008202313.GC4718@free.fr>
References: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141008202313.GC4718@free.fr>
Message-ID: <20141008222548.259fca7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 8 Oct 2014 22:23:13 +0200, Yann E. MORIN wrote:

> > diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> > index 7195234..693028c 100644
> > --- a/docs/manual/faq-troubleshooting.txt
> > +++ b/docs/manual/faq-troubleshooting.txt
> > @@ -35,7 +35,9 @@ target_ would be stopped from the Buildroot-2012.11 release because:
> >  * this feature was only available for Buildroot toolchains;
> >  * Buildroot mostly targets _small_ or _very small_ target hardware
> >    with limited resource onboard (CPU, ram, mass-storage), for which
> > -  compiling does not make much sense.
> > +  compiling on the target does not make much sense;
> 
> I'd phrase that differently:
> 
>     Buildroot mostly targets _small_ or _very small_ target hardware
>     with limited resource onboard (CPU, ram, mass-storage), on which
>     compiling does not much much sense.
> 
> Note:  s/for/on/

Right, that's another option, but I find my version to be even more
explicit. Your version is correct, but still leaves a still bit of
fuzziness about the machine on which we're talking about compiling
things on.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
