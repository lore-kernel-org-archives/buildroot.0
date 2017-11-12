From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Nov 2017 10:10:28 +0100
Subject: [Buildroot] [PATCH 1/4 v3] package/freerdp: drop dependency on
 host-pkgconf
In-Reply-To: <67b488af759e72096a4cf414c5fa06344561c677.1510474387.git.yann.morin.1998@free.fr>
References: <cover.1510474387.git.yann.morin.1998@free.fr>
 <67b488af759e72096a4cf414c5fa06344561c677.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKN1XQpqMFM_XPphg6vNdYx1m4rJEfokZYDpcfg=iUbTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 12, 2017 at 9:13 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, we only depend on host-pkgconf for gstreamer-0.x
>
> However, we also need it at least for gstreamer-1.x and waylabnd, too.
>
> But since FreeRDP is a cmake package, host-pkgconf is always pulled in
> as a dependency by the cmake-package infrastructure.
>
> So, drop the gstreamer-conditional host-pkgconf dependency.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
