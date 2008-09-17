From: =?ISO-8859-1?Q?St=E9phane?= Mancini <stephane.mancini@grenoble-inp.fr>
Date: Wed, 17 Sep 2008 16:09:10 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <8763ov0x4c.fsf@macbook.be.48ers.dk>
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
	<1221648506.30276.10.camel@chip.lis.inpg.fr>
	<874p4f2elw.fsf@macbook.be.48ers.dk>
	<1221652957.30276.16.camel@chip.lis.inpg.fr>
	<1221654253.30276.18.camel@chip.lis.inpg.fr>
	<8763ov0x4c.fsf@macbook.be.48ers.dk>
Message-ID: <1221660550.30276.25.camel@chip.lis.inpg.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes that's it !
It's working.

Please, if you come to Grenoble, I would be happy to offer you a beer !




Le mercredi 17 septembre 2008 ? 14:34 +0200, Peter Korsgaard a ?crit :
> >>>>> "St?phane" == St?phane Mancini <stephane.mancini@grenoble-inp.fr> writes:
> 
>  St?phane> Well, I've tried to launch ash after the boot instead of init.
>  St?phane> I get a kernel panic :
> 
>  St?phane> init has generated signal 4 but has no handler for it
> 
>  St?phane> Kernel panic - not syncing: Attempted to kill init!
> 
>  St?phane> Rebooting in 180 seconds..
> 
> Did you by any change configure buildroot for hardware floating point
> and not enable the FPU emulation in the kernel?
> 
-- 
|St?phane Mancini   Ma?tre de Conference ENSIMAG/GIPSA-lab DIS
| Tel : 04 76 57 43 58
| 961 rue de la Houille Blanche
| Domaine universitaire - BP 46
| 38402 Saint Martin d'H?res cedex
| Email : stephane.mancini at grenoble-inp.fr
| http://www.lis.inpg.fr/pages_perso/mancini
================================================
Join us for the DASIP'08 Conference
ULB, Bruxelles, Belgique
Visit http://www.ecsi.org/dasip/
================================================
