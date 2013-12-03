From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 3 Dec 2013 09:08:18 +0100 (CET)
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
 not development
In-Reply-To: <87zjoipdlk.fsf@dell.be.48ers.dk>
Message-ID: <1707580650.15811727.1386058098089.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Committed, thanks.
> 
> I'm really starting to think we should get rid of
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, or atleast make it default y.
> 
> Comments, anybody?
> 


I personally don't know exactly what busybox provides, this option is
a simple way to make sure I don't compile any useless stuff...

I'm in favor of keeping it or provide another way to find duplicates

> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
