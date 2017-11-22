From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:54:39 +0100
Subject: [Buildroot] [PATCH 1/2] openntpd: update to 6.2p3
In-Reply-To: <20171120051147.qoedwxoxivo3encc@sapphire.tkos.co.il>
References: <20171108130459.25412-1-aduskett@gmail.com>
 <20171108133119.5f3vd7d2owvvtevc@tarshish>
 <CAFSsvmqDFVSSwmT0FaUqQmZh3xR92pSxmdV_V2PQ2H_EFEF1Pg@mail.gmail.com>
 <20171120051147.qoedwxoxivo3encc@sapphire.tkos.co.il>
Message-ID: <20171122225439.7b411286@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 07:11:47 +0200, Baruch Siach wrote:

> > Still broken :\  
> 
> What is broken?
> 
> I case AUTORECONF is still necessary even after the Makefile.am patch removal, 
> the comment needs update.

Because our libtool patch doesn't apply to openntpd's ltmain.sh. So
I've kept the AUTORECONF = YES (after updating the comment, of course).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
