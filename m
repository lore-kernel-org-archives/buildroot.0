From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 22 Nov 2015 11:47:08 -0200
Subject: [Buildroot] Analysis of build results for 2015-11-21
In-Reply-To: <20151122105711.185037f6@free-electrons.com>
References: <20151122073011.8CA87102679@stock.ovh.net>
 <20151122105711.185037f6@free-electrons.com>
Message-ID: <CABLs7GX0SsoOF-aYM7nHShD4Exbmx5yf+pteGPmfYpsuHryCgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-11-22 7:57 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
>>          arm |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/14e291e22b8c8a9c590f0c6ef4316f8ab0aa1fff/
>
> musl build problem, missing <sys/queue.h>
>

I've taken the liberty to look into this issue and have sent a patch to fix it.

Regards,
Rodrigo

[snip]
>
> Best regads,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
