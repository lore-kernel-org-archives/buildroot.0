From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 16 Nov 2009 23:02:41 +0100
Subject: [Buildroot] ldd disappearing from rootfs
Message-ID: <4B01CC01.2000907@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While searching why ldd disappeared from the /usr/bin/ of my target
since I updated my Buildroot, I found that the rule installing it was
commented by this commit:
http://git.buildroot.net/buildroot/commit/?id=cb815ae003d40cc971d6e214415c10e9a160ba82
(last chunk of the commit)

Yes, I know, it's quite old now, but the ldd disappearing is on my TODO
list since ages :-)
Do somebody recall why this line was commented out ? (I don't see the
link with the commit title)

I have put Ivan (the author of the commit) in copy.

Regards,
Julien
