From: M. Edward (Ed) Borasky <znmeb@cesmail.net>
Date: Wed, 15 Nov 2006 06:25:14 -0800
Subject: [Buildroot] Better package 'howto' documentation - anywhere ?
In-Reply-To: <loom.20061115T145029-246@post.gmane.org>
References: <loom.20061115T145029-246@post.gmane.org>
Message-ID: <455B234A.1000309@cesmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW wrote:
> I'd be grateful if anyone had a link to details / guidelines
> for adding a package containing possibly more than one Library target.
>
> The basic doc with Buildroot only considers one Binary target, and
> so there is no involvement with using objects in the Staging directory
> (headers and libraries), or with optional targets configured from Menuconfig.
>
> Yes, I can and have looked in other packages, but it would be good
> to have a 'vanilla' case, the others seem to have different exceptional
> requirements ! (And have been done in slightly different styles.)
>
> Alternatively a more theoretical treatment, that would allow you
> to derive the required steps, might be useful.
>
> Thanks,
>
> MikeW
>   
I agree ... just about every package I want to add has a very detailed 
build process. While a package's build process may be *derived* from the 
GNU/Linux base (configure, make, make test, make installed) it's not at 
all clear what has to be in <package>.mk for all the native build steps 
to work.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   


-- 
M. Edward (Ed) Borasky, FBG, AB, PTA, PGS, MS, MNLP, NST, ACMC(P)
http://borasky-research.blogspot.com/

If God had meant for carrots to be eaten cooked, He would have given rabbits fire.
