From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Jun 2017 14:50:23 -0400
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <BN6PR03MB2914652860FFB5C01F6CE128BFCC0@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914ED0870804EEF5408B906BFC90@BN6PR03MB2914.namprd03.prod.outlook.com>
 <20170609090628.5f4d5af3@free-electrons.com>
 <BN6PR03MB29148981A29B24CED48107ADBFCE0@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914652860FFB5C01F6CE128BFCC0@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <20170611185020.jjlo6za6ln7we4f5@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brent,

On Sun, Jun 11, 2017 at 05:45:55AM +0000, Brent Sink wrote:
> Thomas,
> 
> > > Which version of gcc are you using? Does it support C++11 ?
> 
> > The gcc version is 5.4.0, and when I pass the -std=c++11 it will build for c++11.
> 
> Since you asked the question about gcc, should I be using something other than the cross compiler provided by buildroot?  Right now it's using this one: buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc

I built Qt WE 5.8 with GCC 6.x with glibc.

I am not sure, but I think I met the same issue with GCC 5.x.

> 
> Any thoughts on what I may be doing wrong?
> 

If you build for rpi 3, are you using the raspberrypi3_qt5_defconfig I sent from
the patch 3/3 [1]? Normally, this defconfig works fine for rpi3.

Regards,
Gael

[1]: https://patchwork.ozlabs.org/patch/742259/
