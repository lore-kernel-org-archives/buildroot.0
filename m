From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:08:48 +1100
Subject: [Buildroot] [PATCH] SDL2_X11 depends on MMU (fork)
In-Reply-To: <20170119215327.10668-1-romain.naour@gmail.com>
References: <20170119215327.10668-1-romain.naour@gmail.com>
Message-ID: <20170120140848.0978edc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 22:53:27 +0100, Romain Naour wrote:
> From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> Fixes autobuilder failure http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa
> 
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Cc: baruch at tkos.co.il
> Cc: romain.naour at gmail.com
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Guillaume's email sent with git send-email seems rejected by the mailing list server...
> ---
>  package/sdl2/Config.in | 1 +
>  1 file changed, 1 insertion(+)

I've applied, after fixing two things:

 - The commit title did not comply with our usual practice, it was
   lacking a package prefix, "sdl2: ".

 - The depends on BR2_USE_MMU dependency was not provided to the
   Config.in comment as it should have been.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
