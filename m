From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 13 Aug 2020 11:52:33 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200812102236.631c057f@windsurf.home>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200811235833.03115c8b@windsurf.home>
 <CA+h8R2qLY-5FbL_HTjwTH_i=w3ky_=C=17n48_=18-E=9mUYVg@mail.gmail.com>
 <20200812102236.631c057f@windsurf.home>
Message-ID: <CAFSsvmqzkM2N2syEMc1AZeeRdvQ-HRtkK4zFSOp3q-qumYmCKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

I submitted a patch based on Mirza's suggestion above which works as expected:
https://patchwork.ozlabs.org/project/buildroot/patch/20200813184947.4042927-1-aduskett at gmail.com/


On Wed, Aug 12, 2020 at 1:22 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 11 Aug 2020 19:26:42 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > > Can this be fixed somehow ?
> >
> > Yes. Please merge this patch series:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=161729
>
> Hm, ok. The issue is that this series is quite complex, too complex to
> merge in master right now as we have already cut -rc1.
>
> Do we have an intermediate solution for 2020.08 ? Would reverting the
> mender-artifact bump resolve the issue ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
