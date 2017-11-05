From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Nov 2017 22:17:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: always uses pkg-config
In-Reply-To: <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
 <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJuTNZJhqOBdjAP3zfAQ2heOXoq+qscLXwKFy8GE8oYmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Nov 5, 2017 at 7:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, we only deopend on host-pkgconf for gstreamer-0.x
>
> However, we also need it at least for gstreamer-1.x and waylabnd, too.
>
> Make it a mandatory dependency, no matter what.

Since freerdp uses the cmake infrastructure, it already has
host-pkgconf among its dependencies (c.f. [1])

Regards,

[1] https://git.buildroot.net/buildroot/tree/package/pkg-cmake.mk#n151


-- 
Samuel
