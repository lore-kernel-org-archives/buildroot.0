From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Feb 2018 20:26:40 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump to 1.28.0
In-Reply-To: <CAFSsvmpxvze6Q5MNzbebkrGMkg50QscTEcQBqL+t_K53ZCAV_Q@mail.gmail.com>
References: <20180207145215.19465-1-aduskett@gmail.com>
 <20180207145915.pxmyc7ggfscxkpxs@sapphire.tkos.co.il>
 <CAFSsvmpxvze6Q5MNzbebkrGMkg50QscTEcQBqL+t_K53ZCAV_Q@mail.gmail.com>
Message-ID: <20180207182640.eoqb3azybouhpp7s@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Feb 07, 2018 at 10:30:48AM -0500, Adam Duskett wrote:
> On Wed, Feb 7, 2018 at 9:59 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Feb 07, 2018 at 09:52:15AM -0500, Adam Duskett wrote:
> >> Other changes:
> >>  - Update 0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> >>    for 1.28.0
> >>  - Remove upstream patches 3, 4, and 5.
> >>  - Update buxybox.config and busybox-minimal.config
> >
> > Also fixes CVE-2017-15873 (upstream commit 0402cb32d), and CVE-2017-15874
> > (upstream commit 9ac42c500586).
>
> I didn't catch that! Thanks!
> Should I resubmit?

I don't think so. The maintainers would probably fix that while applying.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
