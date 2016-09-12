From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Sep 2016 14:39:43 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-11
In-Reply-To: <20160912063028.65AFB103B93@stock.ovh.net>
References: <20160912063028.65AFB103B93@stock.ovh.net>
Message-ID: <CAKmqyKOAaZYPwd3GwvBsz7CwiF93-m=5rh=z6vv9o4RTsHod0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 11, 2016 at 11:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2016-09-11
> ================================
>
>       successes : 227
>        failures : 94
>        timeouts : 6
>           TOTAL : 327
>
> Classification of failures by reason
> ====================================
>
>                 upmpdcli-1.2.2 | 13
>                libupnpp-0.15.0 | 10
>                      xen-4.7.0 | 6

...

>      aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/9e733b8afb51add44fcf675fb25c05fe52773de7
>          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/fc39051eb0c466493a69bd9a320e6046a66db51e
>          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/65096ed770f89da2c928f504d84fc811619037d5
>          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/051d916bb12f1a0a0bfc5e2362e7a9b1488717f1
>          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bcd784b22c0335c04960e1a5601e1925134f5edf
>          arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/563f086f127b2a59edbe2adcfd730378d1a5d5f0

Xen 4.7 has started failing and it looks to be related to a lack of
gettext. I can't see any recent changes that should have broken this.

Does anyone have any idea what has changed with gettext?

Thanks,

Alistair

>          arm |              xscreensaver-5.32 | TIM | http://autobuild.buildroot.net/results/f7418f9ce17b52586d781715a0dbd3d0208d780c
>      powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/04a00ffdf605701f644dbc3165fb74d437724b4c
>      powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/91f3d997974ce2e23b8e98b665d6308cff377e6f
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
