From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:44:03 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support
 for static build only
In-Reply-To: <CABLs7GVft7bo9tdj8wMh4E0Z9DNQssZNWw4XYo9V=ANBdpceOg@mail.gmail.com>
References: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
 <20160221181830.01215f6e@free-electrons.com>
 <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
 <20160221211340.4db41609@free-electrons.com>
 <CABLs7GVft7bo9tdj8wMh4E0Z9DNQssZNWw4XYo9V=ANBdpceOg@mail.gmail.com>
Message-ID: <20160221214403.217426b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Sun, 21 Feb 2016 17:37:28 -0300, Rodrigo Rebello wrote:

> That's a good point. Well, at least chocolate-doom is being actively
> maintained, so we'll be able to upstream a patch in that case.
> 
> As for the other 3, do you think keeping patches for them in buildroot
> could turn out to be a hassle in the long run?

Having patches that are not upstream is a hassle in general.

But since those packages are basically unmaintained upstream as far as
I remember, it means upstream won't do any new release, and therefore
we won't have to update/change the patches. Having patches is really a
big annoyance when the upstream project is still active and makes
releases, since we have to update our patches whenever we bump the
package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
