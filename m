From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Tue, 1 Aug 2017 22:31:41 +0530
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-30
In-Reply-To: <20170801184924.4a82a5fa@windsurf.home>
References: <20170731063108.12B5521DFC@mail.free-electrons.com>
 <CA+NV+VnF02-_eYGDycSH-EMJVZyNkjwj74dSAmxpSjLG2fobdQ@mail.gmail.com>
 <20170801184924.4a82a5fa@windsurf.home>
Message-ID: <CA+NV+Vn8vZv8vzyGVx6VToYdGZKEVRiL57WjQdSoc2Cdaa_sXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Aug 1, 2017 at 10:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> You have not re-used the defconfig used by the autobuilders. What
> Buildroot is saying here is that:
>
>  - The toolchain tarball contains a toolchain that uses the kernel
>    headers 4.12
>
>  - You told Buildroot, through the option
>    BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD, that you have a toolchain
>    that uses 2.6.x kernel headers
>
> And therefore, Buildroot complains.

I usually copy defconfig from autobuilder link location and work with
it to reproduce issue.

>
> Remember that you can use the script at
> https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
> to reproduce a build failure. I.e:
>
>         ./br-reproduce-build af946fa6fe05ee265e4ac97742b15afeb0cea1ab

I will try this now.

Thanks,
Rahul
