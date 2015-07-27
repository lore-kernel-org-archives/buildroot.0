From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 27 Jul 2015 20:23:25 +0000
Subject: [Buildroot] Autobuilder update: ARC toolchain updated
Message-ID: <9bab4b24-a7a4-46e2-a93b-06008b42ef69@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

27 ???? 2015 ?. 11:17 PM ???????????? Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ???????:
>
> Hello,
>
> I just pushed a minor update to the autobuilder configuration: I
> rebuilt the ARC pre-built toolchain with the latest Buildroot master.
> This should fix many of the .tbss related build problem.
>
> See:
>
>   http://git.buildroot.net/buildroot-test/commit/?id=c1b141aa4f892493d9e6cb6361d0edf68575798b
>
> I will probably rebuild all Buildroot pre-built toolchains once -rc1 is
> released.
>

Thanks for doing that.
But I have to tell you that even with that updated toolchain .tbss issues won't go completely.

You'll see a bit of a different issue specifically linking applications with lots libstdc++.

We're aware of that new issue (.tbss fix was unfortunately incomplete) and working on proper fix.

BTW when are you going to cut rc1? I'll try to make sure our fix is ready by then.

-Alexey
