From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Mon, 12 Dec 2011 09:25:52 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87liqkkyzz.fsf@macbook.be.48ers.dk>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk> <4EE32E12.3000303@free.fr>
 <87liqkkyzz.fsf@macbook.be.48ers.dk>
Message-ID: <4EE5BA90.9040205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 10/12/2011 20:28, Peter Korsgaard a ?crit :
>>>>>> "Guillaume" == Guillaume Gardet<guillaume.gardet@free.fr>  writes:
> Hi,
>
>   Guillaume>  I am using openSUSE (not SUSE Enterprise). Which version are
>   Guillaume>  you using?  PATH should not contain . and mine (openSUSE
>   Guillaume>  12.1) does not have it.
>
> OpenSUSE 12.1 installed from the gnome livecd. Everything standard
> except for the extra packages needed for buildroot.
>
It is best to install from DVD (especially for non english langages). I assumed you used a 64-bit live CD.

Anyway, I found the (openSUSE) problem and made a patch for it. (See my previous email).

Regards,

Guillaume
