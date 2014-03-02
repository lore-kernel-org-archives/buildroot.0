From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Mar 2014 18:27:57 +0100
Subject: [Buildroot] [PATCH 02/19] package/libegl: rename package and
 the _HAS and _PROVIDES variables
In-Reply-To: <bdab4a6acd512c37b514710f121b1cb91cacb4eb.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
 <bdab4a6acd512c37b514710f121b1cb91cacb4eb.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJLyJXcnX4sGah8JRRRyHwQMvr1WifHwC1CADDtOaW_KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 2, 2014 at 5:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The basic rule for a package is to have its options named
> after the package name. There is no reason this should not
> also be the case for virtual packages.
>
> Besides, this will allow us to switch libegl to use the
> soon-to-be-introduced virtual-package infrastructure.
>
> Rename the package to opnegl-libgles so:
>   - it has 'opengl' in its name, so it is easier to find
>   - it has 'libgles' (the name of the library file), as the
>     other Khronos-related packages do
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Cc: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
