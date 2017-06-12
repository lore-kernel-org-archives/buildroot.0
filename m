From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Jun 2017 20:27:43 +0300
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
 <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
 <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
Message-ID: <20170612172743.xjuawqu3a3oyvdfx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jun 12, 2017 at 03:48:06PM +0000, Yann E. MORIN wrote:
> On 12 June 2017 17:23:32 CEST, Baruch Siach <baruch@tkos.co.il> wrote:
> >On Mon, Jun 12, 2017 at 11:09:41AM -0400, MD I. Islam wrote:
> >> I'm new to Buildroot. I'm using *arm_foundationv8_defconfig* as my
> >config.
> >> But I'm getting the error *scsi/scsi.h: No such file or directory*. I
> >> cleaned and  rebuild the code, but getting the error every time.
> >Could
> >> anyone suggest what is wrong?
> >
> >There is no arm_foundationv8_defconfig in mainline Buildroot.
> 
> Unless I missed something, yes there is...

Ah, of course. I somehow expected arm_ to precede armadeus_. Sorry.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
