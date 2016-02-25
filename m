From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 Feb 2016 21:15:12 +0100
Subject: [Buildroot] buildroot with linaro-5.2-2015.11-1 toolchain
In-Reply-To: <CAF_dkJB=bcGLC7cTKxz=cDGa12D5DqT4JX-qDDyApjFswtraDQ@mail.gmail.com>
References: <CAF_dkJB=bcGLC7cTKxz=cDGa12D5DqT4JX-qDDyApjFswtraDQ@mail.gmail.com>
Message-ID: <56CF60D0.6060500@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 25/02/2016 21:02, Patrick Doyle a ?crit :
> arrgghh...nothing seems to be going smoothly today.  Well, some days
> are like that..
> 
> Is buildroot known to work (or not work) with the linaro-5.2-2015.11-1
> toolchain (available at
> https://releases.linaro.org/components/toolchain/binaries/latest-5.2/arm-linux-gnueabihf/)
> specified as an external preinstalled toolchain?

Don't use 5.2-2015.11-1 it's broken use 5.2-2015.11-2 which is already supported
by Buildroot 2016.02-rc2.

See https://bugs.linaro.org/show_bug.cgi?id=1995

> 
> Obviously, I'm asking because it's not working for me.  Things appear
> to start going south when the following command:
> 
> $ arm-linux-gnueabihf-gcc -print-file-name=libc.a
> 
> 
> produces the following output on my system:
> 
> libc.a
> 
> Did I do something wrong when I installed it?  (I just unpacked it into /opt).

Just use latest master or 2016.02-rc archive :p

Best regards,
Romain

> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
