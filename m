From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 7 Nov 2016 18:30:29 +0100
Subject: [Buildroot] telit_evk_pro3_defconfig fails to build
In-Reply-To: <20161105152013.615d71d7@free-electrons.com>
References: <20161105152013.615d71d7@free-electrons.com>
Message-ID: <CAHkwnC_jVyVQ27Y6aOr3hLthmUrd70Ep0ufJULB+4jP3zHrYJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-05 15:20 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello Fabio,
>
> Back in 2013, you contributed telit_evk_pro3_defconfig to Buildroot.
> Unfortunately, this defconfig no longer builds: the Linux kernel
> version used is too old to build with gcc 5.x.
>
> Do you still have access to this HW platform? If so, can you contribute
> a patch to update the defconfig? If you're no longer interested by this
> platform, we can also decide to remove its defconfig.
>
> You can see the full build log at
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/telit_evk_pro3_defconfig.log.FAIL.
>
> Thanks!

Hi Thomas,

I will  try to make a patch to fix it.

Thanks
-- 
Fabio Porcedda
