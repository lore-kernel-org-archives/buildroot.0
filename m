From: D. Olsson <hi@senzilla.io>
Date: Sat, 10 Apr 2021 17:45:14 +0000
Subject: [Buildroot] Build failure with alpine
In-Reply-To: <66004670-FB20-4C02-9998-B7071C0F6249@yahoo.com>
References: <66004670-FB20-4C02-9998-B7071C0F6249.ref@yahoo.com>
 <66004670-FB20-4C02-9998-B7071C0F6249@yahoo.com>
Message-ID: <xIp1JH_ed4MWgeXSLJV4_RkozfySeW2Eb0cQkNvYdLfLjTV0KHtUDd3qk0KRH51379-4mcpWTlFJmN-YZebcJOuUOyNfL1bzOyyS1D2U6JE=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicary,

Were you able to solve this?

I have run into this exact same issue on two separate Alpine host machines (x86 and aarch64).

D. Olsson
PGP: 8204A8CD

??????? Original Message ???????

On Monday, December 28th, 2020 at 9:27 AM, Vicary A via buildroot <buildroot@busybox.net> wrote:

> Hello everyone,
>
> I am new to buildroot, please let me know if this is not the correct place for general help.
>
> This is my first time building buildroot, I started with a clean alpine container with the 2020.11 archive.
>
> I installed alpine equivalents of recommended prerequisites from the official site, packages are:
>
> I typed "make raspberrypi4_64_defconfig" followed by "make all", I can see most of the compilation went through until I get the following lines:
>
> making install in e2fsck
>
> make[2]: Entering directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
>
> MKDIR_P /root/buildroot/output/host/sbin /root/buildroot/output/host/share/man/man8
>
> make[2]: config/install-sh: No such file or directory
>
> make[2]: *** [Makefile:522: installdirs] Error 127
>
> make[2]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
>
> make[1]: *** [Makefile:433: install-progs-recursive] Error 1
>
> make[1]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6'
>
> make: *** [package/pkg-generic.mk:260: /root/buildroot/output/build/host-e2fsprogs-1.45.6/.stamp_host_installed] Error 2
>
> (Full output log attached)
>
> Where shall I start? Any help is appreciated.
>
> Best,
>
> Vicary
>
> buildroot mailing list
>
> buildroot at busybox.net
>
> http://lists.busybox.net/mailman/listinfo/buildroot
