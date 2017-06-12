From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Jun 2017 18:23:32 +0300
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
Message-ID: <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tamim,

On Mon, Jun 12, 2017 at 11:09:41AM -0400, MD I. Islam wrote:
> I'm new to Buildroot. I'm using *arm_foundationv8_defconfig* as my config.
> But I'm getting the error *scsi/scsi.h: No such file or directory*. I
> cleaned and  rebuild the code, but getting the error every time. Could
> anyone suggest what is wrong?

There is no arm_foundationv8_defconfig in mainline Buildroot. See the list of 
defconfigs in the current master branch at

  https://git.busybox.net/buildroot/tree/configs

Where have you got your Buildroot source tree from?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
