From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 23:39:21 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <20210314214824.GP2737665@scaer>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
 <CA+h8R2ps1MF-NiZKYWceSTruHLXMpzLPORhzORetVKuF1PWDdA@mail.gmail.com>
 <20210312230903.18bf4a0a@gmx.net>
 <CA+h8R2r7oBE1h7FSQC+CR=q2Vr-K5bS-qkwVFO-+GT24Qb6Raw@mail.gmail.com>
 <20210314124249.GW2737665@scaer> <20210314221809.618a8d72@gmx.net>
 <20210314214824.GP2737665@scaer>
Message-ID: <20210314233921.470d5993@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Christian,

On Sun, 14 Mar 2021 22:48:24 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-03-14 22:18 +0100, Peter Seiderer spake thusly:
> > I can confirm the compile failure in case BR2_PACKAGE_BATMAN_ADV_BATMAN_V is
> > not enabled...., but the buildroot config still states it is 'exerpimental':
> [--SNIP--]
> > According to [1] CONFIG_BATMAN_ADV_BATMAN_V option is enabled by default
> > since 2018.2 (and it seems compile without is not tested very carefully),
> > maybe time to drop the buildroot config option and always enable
> > CONFIG_BATMAN_ADV_BATMAN_V?
>
> I am perfectly OK with dropping the option and always enabling it.
>
> > But will take a deeper look at the source code if the failure is fixable
> > (or post an upstream failure report)...
>
> Cool, thanks! :-)

Seems to be no batman failure but a buildroot defect (see [1]), but
nevertheless provided an additional patch to change the default
(and remove the 'experimental' comment, see [2])...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20210314223207.13460-1-ps.report at gmx.net/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20210314223207.13460-2-ps.report at gmx.net/

>
> Regards,
> Yann E. MORIN.
>
