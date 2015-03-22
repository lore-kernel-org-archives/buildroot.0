From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 22 Mar 2015 22:30:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] boot/uboot: add support for i.MX28
 SD format
In-Reply-To: <1427058925.2141.57.camel@embedded.rocks>
References: <1427030715-1737-1-git-send-email-arnout@mind.be>
 <1427030715-1737-2-git-send-email-arnout@mind.be>
 <1427058163.2141.53.camel@embedded.rocks>
 <1427058925.2141.57.camel@embedded.rocks>
Message-ID: <1427059854.20801.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On So, 2015-03-22 at 22:15 +0100, J?rg Krause wrote:
> Hi Arnout,
> 
> On So, 2015-03-22 at 22:02 +0100, J?rg Krause wrote:
> > Hi Arnout,
> > 
> > On So, 2015-03-22 at 14:25 +0100, Arnout Vandecappelle (Essensium/Mind)
> > wrote:
> > > From: Vincent Stehl? <vincent.stehle@freescale.com>
> > > 
> > > Allow to generate u-boot.sd, Freescale i.MX28 SB format with a header for
> > > booting from an SD card.
> > > 
> > > U-boot includes an mxsboot tool to generate this format, starting from
> > > v2011.12.
> > > 
> > > See u-boot doc/README.mxs (or doc/README.mx28_common before 2013.07).
> > > 
> > > [Arnout:
> > >  - Wrap Config.in help text at 72 columns.
> > >  - Remove v from U-Boot version specifier.
> > >  - Refer to different README name before 2013.07.
> > >  - Depend on host-elftosb
> > 
> > host-elftosb is not necessary anymore. BootStream support has been
> > merged upstream and it's not necessary to convert the u-boot binary with
> > elftosb. This should be removed for u-boot.sb make target as well. 
> 
> Sorry, I just saw your comment on this in the other mail. Would it make
> sense to extract the version from the Makefile in uboots build
> directory?
> 

Stupid idea from me, it's about build dependency. Please, forget this :)
