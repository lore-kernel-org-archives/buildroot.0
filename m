From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Feb 2018 07:40:01 +0200
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <CAOMZO5CQn2i-Z=h4DjcUnnUsmhbuqK7uaBY1ufUgZw-D5231xQ@mail.gmail.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
 <CAOMZO5Bb0-Ng=OYi1EqXsKWsQTHuCkO+fyCktcZqCa-GjVaxpQ@mail.gmail.com>
 <20180206210235.0c9b8056@windsurf>
 <CAOMZO5CQn2i-Z=h4DjcUnnUsmhbuqK7uaBY1ufUgZw-D5231xQ@mail.gmail.com>
Message-ID: <20180207054000.mqvx2ihfxbi6qrba@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Tue, Feb 06, 2018 at 11:30:00PM -0200, Fabio Estevam wrote:
> On Tue, Feb 6, 2018 at 6:02 PM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
> > Which version of tar are you using? Which version of tar is Evgeniy
> > using?
> 
> I tested this series against master, which uses tar-1.29 version.

Thomas asks about your host installed tar version. Buildroot builds its own 
host-tar only when the host is missing a suitable tar.

This is related to the issue discovered with tar version 1.30 that generates 
slightly different archives.

  http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html

This has also been discussed in the last developers meeting (first item):

  https://annuel2.framapad.org/p/BuildrootFosdem2018

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
