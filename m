From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2011 14:49:34 +0200
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
 DM365 processors
In-Reply-To: <87wrc2321l.fsf@macbook.be.48ers.dk>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
 <201110181123.03836.arnout@mind.be>
 <201110181433.26332.arnout@mind.be>
 <87wrc2321l.fsf@macbook.be.48ers.dk>
Message-ID: <20111018144934.2a9ed9b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 14:41:10 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Arnout>  Fortunately, TI's license allows redistribution in any form.
>  Arnout>  So we are allowed to repackage the extracted source/binary
>  Arnout>  code.  That would be my preferred approach: download a .tgz
>  Arnout>  from the buildroot mirror instead of going through the mess of
>  Arnout>  running installer binaries.
> 
>  Arnout>  Peter, is that an acceptable solution?
> 
> Hmm, I would prefer not to, but if there's no other option..

There is a similar problem with the TI OpenGL drivers. The Graphics SDK
available from TI website is a huge auto-extractable binary which
contains (amongst a ton of crap) the binary driver. Some embedded Linux
build systems (such as OpenBricks) have re-packaged only the necessary
bits, have put those tarballs online and use them in their package
recipes instead of the original TI stuff.

Ideally, I'd prefer to use the original TI stuff as well, but the size
of the downloads are horribly huge, and they keep moving things around
on their website all the time. It is not even simple to find what it
the latest version of what. TI's management of software support is
really horrible.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
