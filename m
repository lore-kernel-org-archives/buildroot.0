From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Jun 2017 20:33:45 +0300
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <CAM7NYTjHa0waAPpauLhFL1j60pnmskGcZRUVR9G7iNYnWyCHQg@mail.gmail.com>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
 <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
 <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
 <CAM7NYTjHa0waAPpauLhFL1j60pnmskGcZRUVR9G7iNYnWyCHQg@mail.gmail.com>
Message-ID: <20170612173345.kqjxqzsoznsgjhkh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tamim,

On Mon, Jun 12, 2017 at 12:43:24PM -0400, MD I. Islam wrote:
> I'm using the main source tree. I get the same error on other configs as
> well ( such as *beaglebone_defconfig)*. Does it mean that the problem is to
> do with my host machine?

Did you change anything in the build configuration other than applying these 
defconfigs? If so, please post your .config.

Also, please post the last ~100 lines of your build output.

baruch

> On Mon, Jun 12, 2017 at 11:48 AM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> 
> > On 12 June 2017 17:23:32 CEST, Baruch Siach <baruch@tkos.co.il> wrote:
> > >On Mon, Jun 12, 2017 at 11:09:41AM -0400, MD I. Islam wrote:
> > >> I'm new to Buildroot. I'm using *arm_foundationv8_defconfig* as my
> > >config.
> > >> But I'm getting the error *scsi/scsi.h: No such file or directory*. I
> > >> cleaned and  rebuild the code, but getting the error every time.
> > >Could
> > >> anyone suggest what is wrong?
> > >
> > >There is no arm_foundationv8_defconfig in mainline Buildroot.
> >
> > Unless I missed something, yes there is...
> >
> > Regards,
> > Yann E. MORIN.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
