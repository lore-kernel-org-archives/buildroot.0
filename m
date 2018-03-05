From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 Mar 2018 18:09:36 +0100
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <20180304224808.566fa00d@windsurf.home>
References: <20180304224808.566fa00d@windsurf.home>
Message-ID: <CAHkwnC_CBRZGZmV9J7PbWYdyquMHh4OdYVdsMdxWq-_+4F2QGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-04 22:48 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> You are in charge of a defconfig that causes some build failures.
>
> The defconfigs listed below still don't build with gcc 6.x. It is more
> than time to fix those defconfigs: gcc 6.x has been around for a
> while. If those defconfigs are not fixed in the very near future, we
> will have to remove them. Usually, the fix is to upgrade the U-Boot
> and/or Linux kernel version.
>
...
>  - telit_evk_pro3_defconfig
>
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/55306952
>
>    Fabio (Porcedda): could you add yourself as the maintainer for this
>    board in the DEVELOPERS file ? Thanks!
>

Unfortunately a newer kernel doesn't boot and I don't have the time to
fix the issue.
If having a defconfig that doesn't build on gcc 6.x is unacceptable
feel free to remove it.

Best regards
-- 
Fabio Porcedda
