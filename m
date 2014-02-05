From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 5 Feb 2014 16:22:43 +0100 (CET)
Subject: [Buildroot] [PATCH 3/3] infra: replace BUILDROOT_CONFIG with
 BR2_CONFIG.
In-Reply-To: <2096745862.5053649.1391592298155.JavaMail.root@openwide.fr>
Message-ID: <82899192.5073088.1391613763374.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oh, and by the way

Tested-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> 
> > > 
> > > which is adapted from the mkusers script... and it failed
> > > silently.
> > 
> >  Really silently? sed should complain on stderr that the file
> >  doesn't
> > exist, but indeed the script will continue with an empty
> > BR2_RASPAUDIO_PAACCESS variable.
> > 
> 
> I missed the message in the build log, but indeed, sed did print an
>  error with the usefull variable content on stderr
> 
> so this works as expected and is a case of "this is the best we can
> do" since we can't proactively check the scripts...
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
