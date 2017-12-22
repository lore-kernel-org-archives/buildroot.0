From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 22 Dec 2017 22:52:35 +0100
Subject: [Buildroot] How to force mesa3d to use llvmpipe?
In-Reply-To: <1513977748342-0.post@n4.nabble.com>
References: <1513976018164-0.post@n4.nabble.com>
 <1513977748342-0.post@n4.nabble.com>
Message-ID: <7829580e-0ae9-e063-5124-c4e2cde424da@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nimai,

Le 22/12/2017 ? 22:22, nimaim a ?crit?:
> Looks like BR may still not have llvmpipe support. Curious if this patch got
> anywhere?
>  http://lists.busybox.net/pipermail/buildroot/2017-July/195823.html

This patch series is still present in the patchwork [1] but this work need to be
updated with the latest llvm/clang release (5.0.1).

However, you can still test this series and you should be able to use llvmpipe.

I have not announced it yet on the mailing list that there will be a student at
Smile working on this subject. He will present his internship topic during the
next Buildroot meeting [2].

Enabling llvmpipe support in mesa is not really difficult but packaging
llvm/clang is a more difficult and time consuming task.

You're welcome to work on this series and give some feedback.

Best regards,
Romain

[1] http://patchwork.ozlabs.org/bundle/kubu/llvm-clang
[2] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018#Meeting_agenda

> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
