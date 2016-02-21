From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 21 Feb 2016 17:37:28 -0300
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support
 for static build only
In-Reply-To: <20160221211340.4db41609@free-electrons.com>
References: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
 <20160221181830.01215f6e@free-electrons.com>
 <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
 <20160221211340.4db41609@free-electrons.com>
Message-ID: <CABLs7GVft7bo9tdj8wMh4E0Z9DNQssZNWw4XYo9V=ANBdpceOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2016-02-21 17:13 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
> This is obviously the best option. Unfortunately, many of those
> packages are not maintained, so we can't upstream the patches you're
> talking about...
>

That's a good point. Well, at least chocolate-doom is being actively
maintained, so we'll be able to upstream a patch in that case.

As for the other 3, do you think keeping patches for them in buildroot
could turn out to be a hassle in the long run?

Rodrigo
