From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Thu, 20 Jun 2013 19:16:23 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <20130619121625.3a47c45e@skate>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org> <20130619102133.7570dcd4@skate>
 <kprv8d$6iq$1@ger.gmane.org> <20130619120616.447be089@skate>
 <kps03n$e9p$1@ger.gmane.org> <20130619121625.3a47c45e@skate>
Message-ID: <kpuh91$4ad$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ah, right, elf2flt isn't a real package, so it fails.
>
> Can you push your current Buildroot code on some Git repository so that
> we can have a look? I looked at your configuration, and I really don't
> see what could be pulling the target binutils into the build.

Sure, you can get it from here:

https://github.com/Malvineous/buildroot-openipcam

Make sure to use the 'nuc700' branch.  Many thanks for taking a look!

Cheers,
Adam.
