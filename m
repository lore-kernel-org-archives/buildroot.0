From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 12 Dec 2014 10:11:52 +0100 (CET)
Subject: [Buildroot] B2_EXTERNAL and patches
In-Reply-To: <trinity-73676462-8b93-436d-9361-468b01882a1f-1418374738886@3capp-gmx-bs63>
Message-ID: <2020988860.29161610.1418375512251.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

you might want to look at https://github.com/Openwide-Ingenierie/buildroot-submodule which is meant to solve that sort of problems.

each variant will share the patch directroy by default, but you can override that on a per-variant basis

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr





----- Mail original -----
> I would like use one minimal patched Builroot release in one branch
> for multiple projects,
> so is it also possible to maintain different patches for a packages
> in different external folders?
> Or could the selecition of patches be controlled by a configuration
> file?
> (the different pachtes are necessary because of differenr kernel
> versions)
> 
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
