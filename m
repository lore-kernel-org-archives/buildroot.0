From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 29 Jul 2016 18:34:52 +0200
Subject: [Buildroot] [PATCH] warpboard: linux.fragment: Do not use
 CONFIG_BRCMFMAC as built-in
In-Reply-To: <CAOMZO5D97HFN-Au4LwWE1QkMdXv--yeA7FYWpU7ScVZ5xGR+yQ@mail.gmail.com>
References: <1469799930-20206-1-git-send-email-fabio.estevam@nxp.com>
 <1469809393.3805.12.camel@embedded.rocks>
 <CAOMZO5D97HFN-Au4LwWE1QkMdXv--yeA7FYWpU7ScVZ5xGR+yQ@mail.gmail.com>
Message-ID: <1469810092.3805.13.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2016-07-29 at 13:29 -0300, Fabio Estevam wrote:
> Hi J?rg,
> 
> On Fri, Jul 29, 2016 at 1:23 PM, J?rg Krause
> <joerg.krause@embedded.rocks> wrote:
> 
> > 
> > > 
> > > --- a/board/freescale/warpboard/linux.fragment
> > > +++ b/board/freescale/warpboard/linux.fragment
> > > @@ -1,2 +1 @@
> > > ?CONFIG_CFG80211_WEXT=y
> > > -CONFIG_BRCMFMAC=y
> > 
> > Shouldn't this be "CONFIG_BRCMFMAC=m"?
> 
> CONFIG_BRCMFMAC=m is already selected in imx_v6_v7_defconfig, so
> that's I why I simply remove this option from linux.fragment.
>?

I see! I did not realize it is a fragment.

J?rg
