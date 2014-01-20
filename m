From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 20 Jan 2014 09:13:10 +0100 (CET)
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <1645253426.4507611.1390204994729.JavaMail.root@openwide.fr>
Message-ID: <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aaand reproduced.

following the steps described, I get that problem systematically

I use make 3.81 (debian testing) and I'm not sure what else is
involved when crashing that early. 


I tried with LANG=C in case there was anything weird, but apparently not

My make skills are not very high so i'll gladly take any help on
figuring that one out...

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75012 Paris - France
www.openwide.fr





----- Mail original -----
> 
> > > 
> > > J?r?my, can you describe your setup, so we can try to reproduce
> > > it,
> > > and
> > > find a proper fix?
> > 
> 
> 
> Ok, i'll look into it and try to figure out...
> 
> it's really weird that you were not able to reproduce with the steps
>  in the patch, it was pretty systematic for me. I'll try to reproduce
> and report whatever I find
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
