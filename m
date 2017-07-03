From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jul 2017 09:05:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-02
In-Reply-To: <20170703063103.B69DB21E07@mail.free-electrons.com>
References: <20170703063103.B69DB21E07@mail.free-electrons.com>
Message-ID: <CAMRc=McdoOQVx4sruhew4wkoORyU9XO93jR5xYV-m=R3RbW5=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-03 8:31 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-07-02, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>       x86_64 |            host-doxygen-1.8.13 | http://autobuild.buildroot.net/results/d177d3f8636a0b877c76b22cae66562f2adb8ac4

This is now fixed with commit 82094f66909b ("doxygen: fix a build issue").

>      sparc64 |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/cb35b17200d965095f1721117dd1322303a7f903
> microblazeel |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/f16bffe6301079f258bb6ca580dd38e9f89f9f5d
>         i586 |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/6a48444f7d21de1a36eeb80040b5af01a24964b3
>       xtensa |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/61679162336f73df8f8d28b1c7eda62e4e97ae7b
>     mips64el |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/826dfda210f10b43ad21379e3a1194be2ada850e
>          arm |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/dad67106ef7f3439059148cdd5ec01d6a0d37f65
>       x86_64 |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/5353c2418c0c3311ef9ecb1f1ddc3ce769369b96
>        nios2 |                libsigrok-0.5.0 | http://autobuild.buildroot.net/results/785bc9cc2e39ea4eaf163e6b27599348cd2231c5
>          arm |                   libzip-1.2.0 | http://autobuild.buildroot.net/results/c50ffa5bf565e75333192edc89e2d39044d07f26
>          arm |                   libzip-1.2.0 | http://autobuild.buildroot.net/results/24d5d9a55a98bcf7c4c057732fad5e6b9cd7e1cb
>
> --
> http://autobuild.buildroot.net

I'll take a look at the rest.

Thanks,
Bartosz
