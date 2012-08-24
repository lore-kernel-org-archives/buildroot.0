From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:40:01 +0200
Subject: [Buildroot] [PATCH] erlang: New package.
In-Reply-To: <CAFbHwiQB22tGasQWEx_vM7kVKbxi=8U5dX8-TA0xfFtMi9Lf5A@mail.gmail.com>
References: <CAFbHwiQB22tGasQWEx_vM7kVKbxi=8U5dX8-TA0xfFtMi9Lf5A@mail.gmail.com>
Message-ID: <20120824234001.5648dd5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 14:01:09 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> Signed-off-by: Will Newton <will.newton@imgtec.com>
> ---
>  package/Config.in                     |    1 +
>  package/erlang/Config.in              |   17 ++++++++++
>  package/erlang/erlang-build-fix.patch |   13 +++++++
>  package/erlang/erlang.mk              |   57 +++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 0 deletions(-)
>  create mode 100644 package/erlang/Config.in
>  create mode 100644 package/erlang/erlang-build-fix.patch
>  create mode 100644 package/erlang/erlang.mk

Your patch was again corrupted, but I fixed that up and committed to
next.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
