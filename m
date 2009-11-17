From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 17 Nov 2009 12:11:19 +0200
Subject: [Buildroot] ldd disappearing from rootfs
In-Reply-To: <4B01CC01.2000907@free.fr>
References: <4B01CC01.2000907@free.fr>
Message-ID: <4B0276C7.8020309@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

Actually I do not remember the reason why I commented out
#$(TARGET_DIR)/usr/bin/ldd
Or may be it was trying to install into my /usr/bin/ replacing my native
host ldd.

Regards,
Ivan
> Hi,
>
> While searching why ldd disappeared from the /usr/bin/ of my target
> since I updated my Buildroot, I found that the rule installing it was
> commented by this commit:
> http://git.buildroot.net/buildroot/commit/?id=cb815ae003d40cc971d6e214415c10e9a160ba82
> (last chunk of the commit)
>
> Yes, I know, it's quite old now, but the ldd disappearing is on my TODO
> list since ages :-)
> Do somebody recall why this line was commented out ? (I don't see the
> link with the commit title)
>
> I have put Ivan (the author of the commit) in copy.
>
> Regards,
> Julien
>
>
>
>   
