From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 2 Feb 2011 12:49:50 +0800
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
 Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <87vd14urk2.fsf@macbook.be.48ers.dk>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=F8BRtskBBKE_Wno=Vy=EHvLjE3bkYagiAuegH@mail.gmail.com>
	<AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
	<87vd14urk2.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTinx51twX6nF5Yxn7iZbNbaocvsrpGp1YUoSTrOT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 1, 2011 at 3:45 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:
>
> ?Sonic> Some autotools based software packages generate prefix name to the
> ?Sonic> binary after running install if you set --target parameter.
>
> ?Sonic> For example:
>
> ?Sonic> --target=arm
>
> ?Sonic> rcp is rename to "linux-arm-rcp" after running install
>
> These packages typically accept the configure options
> --program-transform-name to make them not do that.
>

Yes, but for some packages, --host and --target are not the same as
defined in buildroot.

For example, to build on x86, run on arm and generate binary for mips.


Sonic

> --
> Bye, Peter Korsgaard
>
