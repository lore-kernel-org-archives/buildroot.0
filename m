From: Alexander Khryukin <alexander@mezon.ru>
Date: Sat, 10 Nov 2012 19:31:21 +0300
Subject: [Buildroot] [PATCH] libtool version update 2.4.2
In-Reply-To: <20121110105308.740a3bfa@skate>
References: <1352464732-22984-1-git-send-email-alexander@mezon.ru>
 <20121110105308.740a3bfa@skate>
Message-ID: <CABtOAfzk8GHBemVXM7_at5RwOo24eo4d+sb=wrzjkEEdShsnFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/10 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Alexander,
>
> On Fri,  9 Nov 2012 16:38:52 +0400, Alexander Khryukin wrote:
>
> > -LIBTOOL_VERSION = 2.2.10
> > +LIBTOOL_VERSION = 2.4.2
>
> How much testing did you give to this version bump? A libtool version
> bump is a very sensitive operation, as host-libtool is used to
> autoreconfigure many packages in Buildroot. Therefore, this patch needs
> a good amount of testing before being committed (ideally testing that
> all packages having <foo>_AUTORECONF = YES still build).
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>

With new libtool i built my system many times
and it works.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121110/1f5fde48/attachment-0001.html>
