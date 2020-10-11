From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Oct 2020 19:57:52 -0300
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump U-Boot version
In-Reply-To: <87r1q4y77n.fsf@tarshish>
References: <20201011153251.660778-1-francois.perrad@gadz.org>
 <CAOMZO5B=88j7qCKzMgWf9PEWqqDKASRw4HVa_QJcGrWh2tswSA@mail.gmail.com>
 <CAB0FRstpJscCj3vtxasqcnKLHKj9KcOLjpZHPBHLk1POK5=Ftw@mail.gmail.com>
 <87r1q4y77n.fsf@tarshish>
Message-ID: <CAOMZO5A6j1-0p-OYDbQgo7g8Rp+cwOXhZmq-_TkgEM_vN=nwEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Oct 11, 2020 at 2:59 PM Baruch Siach <baruch@tkos.co.il> wrote:

> > No. At this time, I cannot build uboot 2020.10
> > It seems there is a new dependency on host-swig.
>
> Try enabling BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Yes, that should fix the build problem, thanks.

Hi Fran?ois,

Please try Baruch's suggestion and if it works, please upgrade U-Boot
to 2020.10 instead.

Thanks,

Fabio Estevam
