From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 16 Mar 2019 13:13:02 -0400
Subject: [Buildroot] [PATCH v8 2/3] package/openjdk: package/openjdk:
 Add AArch64 support
In-Reply-To: <20190315220108.1f715b20@windsurf>
References: <20190315205233.128763-1-aduskett@gmail.com>
 <20190315205233.128763-2-aduskett@gmail.com>
 <20190315220108.1f715b20@windsurf>
Message-ID: <CAFSsvmpWCGrH737OCyhDhwRoZt9RmrZj=U2T=AEqdhGjvrAA_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas;
On Fri, Mar 15, 2019 at 5:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 15 Mar 2019 16:52:32 -0400
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > OpenJDK has CPU ports for the AArch64 and ARM architectures.
> > Add support for AArch64 as the first.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> I am still confused by what happens on AArch64 if I only apply PATCH
> 1/3 in this series, but not PATCH 2/3.
>
That would be fine. AArch64 would still work, it just wouldn't be as fast.
This patch only provides optimization.

> Shouldn't PATCH 1/3 restrict package/openjdk to the set of
> known-working architectures ? Is there some architecture specific code
> in openjdk that would make it available only on a subset of the
> architectures we support?
>
Not that I am aware of, although I haven't compiled for every
architecture either.
However; Matthew Webber has compiled for PPC64 and it seems to also work
there.

Thanks!
Adam
> Thanks
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
