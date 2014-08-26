From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Aug 2014 09:36:51 +0200
Subject: [Buildroot] [PATCH v2 1/2] configs/freescale_imx6dlsabresd: add
 defconfig for iMX6DL SabreSD
In-Reply-To: <CADCpmyN=pUb+fMjDwxQFbPCY-59=s4Ont82UuW1FUu452Ng23w@mail.gmail.com>
References: <1408019813-17702-1-git-send-email-luca@lucaceresoli.net>
 <CADCpmyN=pUb+fMjDwxQFbPCY-59=s4Ont82UuW1FUu452Ng23w@mail.gmail.com>
Message-ID: <53FC3913.3060007@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary,

Gary Bisson wrote:
> Hi Luca,
>
> On Thu, Aug 14, 2014 at 5:36 AM, Luca Ceresoli <luca@lucaceresoli.net
> <mailto:luca@lucaceresoli.net>> wrote:
>
>     This is very similar to freescale_imx6sabresd_defconfig, which
>     supports the
>     i.MX6Q ("Quad", quad core CPU) version of the board, except it
>     supports the
>     i.MX6DL (DualLite, dual core CPU) version.
>
>     The differences are in the U-boot configuration and the device tree
>     file.
>
>
> Looks good to me, however I would then rename the previous
> freescale_imx6sabresd_defconfig to freescale_imx6qsabresd_defconfig in
> order for it to be clear.

I was not sure it's a good idea to rename a defconfig, but I see we've
done it before at least once:

     commit 094d8ec896ef0c447a4bfb884753bf8984d67dbc
     Author: mathieu benoit <mathieu.benoit@savoirfairelinux.com>
     Date:   Sun Nov 10 13:16:22 2013 +0100

         configs: rename rpi_defconfig for consistency

     [...]

      board/raspberrypi/readme.txt  |  8 ++++----
      configs/raspberrypi_defconfig | 23 +++++++++++++++++++++++
      configs/rpi_defconfig         | 23 -----------------------
      3 files changed, 27 insertions(+), 27 deletions(-)

So I'll resubmit my patchset with this added.

Thanks,
-- 
Luca
