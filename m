From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Feb 2018 09:44:10 -0200
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <20180207054000.mqvx2ihfxbi6qrba@sapphire.tkos.co.il>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
 <CAOMZO5Bb0-Ng=OYi1EqXsKWsQTHuCkO+fyCktcZqCa-GjVaxpQ@mail.gmail.com>
 <20180206210235.0c9b8056@windsurf>
 <CAOMZO5CQn2i-Z=h4DjcUnnUsmhbuqK7uaBY1ufUgZw-D5231xQ@mail.gmail.com>
 <20180207054000.mqvx2ihfxbi6qrba@sapphire.tkos.co.il>
Message-ID: <CAOMZO5CRpHx4cb4+pcsn7=2L+-iVXWwgeXGR2AQED20vG0-h7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Feb 7, 2018 at 3:40 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Thomas asks about your host installed tar version. Buildroot builds its own
> host-tar only when the host is missing a suitable tar.

Thanks for the clarification!

The host PC also uses tar 1.29 version:

~$ tar --version
tar (GNU tar) 1.29

Thanks
