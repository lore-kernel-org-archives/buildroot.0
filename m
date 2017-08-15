From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Aug 2017 23:57:49 +0200
Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support
In-Reply-To: <20170815205718.cn4a4ggjhonw3w7s@gportay>
References: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
 <20170815225006.0cb00732@windsurf>
 <20170815205718.cn4a4ggjhonw3w7s@gportay>
Message-ID: <20170815235749.30c17b60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 16:57:18 -0400, Ga?l PORTAY wrote:
> Hello Thomas,
> 
> On Tue, Aug 15, 2017 at 10:50:06PM +0200, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Tue, 15 Aug 2017 16:38:52 -0400, Ga?l PORTAY wrote:
> >   
> > > Ga?l PORTAY (3):
> > >   qt5webengine: new package
> > >   configs: new raspberrypi3 qt5we config  
> > 
> > So there are really 2 patches now, not 3 ?
> >   
> 
> Yes, since Yann shows me that I can backport this patch [1], I can drop my patch
> about rpi-userland and library symlinks.

Yes I know that, I followed the discussions. But your cover letter
indicates [PATCH v8 0/3], and contains:

 Ga?l PORTAY (3):
   qt5webengine: new package
   configs: new raspberrypi3 qt5we config  

So you're announcing 3 patches, but you really have 2.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
