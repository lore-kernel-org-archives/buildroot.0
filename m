From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Nov 2009 17:38:44 +0100
Subject: [Buildroot] ldd disappearing from rootfs
In-Reply-To: <4B01CC01.2000907@free.fr> (Julien Boibessot's message of "Mon\,
	16 Nov 2009 23\:02\:41 +0100")
References: <4B01CC01.2000907@free.fr>
Message-ID: <87my2lw1gr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hi,
 Julien> While searching why ldd disappeared from the /usr/bin/ of my target
 Julien> since I updated my Buildroot, I found that the rule installing it was
 Julien> commented by this commit:
 Julien> http://git.buildroot.net/buildroot/commit/?id=cb815ae003d40cc971d6e214415c10e9a160ba82
 Julien> (last chunk of the commit)

 Julien> Yes, I know, it's quite old now, but the ldd disappearing is on my TODO
 Julien> list since ages :-)
 Julien> Do somebody recall why this line was commented out ? (I don't see the
 Julien> link with the commit title)

It seems like a mistake to me - Fixed in git, thanks!

-- 
Bye, Peter Korsgaard
