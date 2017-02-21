From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 14:24:31 +0100
Subject: [Buildroot] Enabling GLX without mesa DRI driver
In-Reply-To: <1900547.3QhRXtFmCM@sagittae>
References: <1674359.6j3vDXU7qK@sagittae>
 <20170221094034.27409318@free-electrons.com>
 <1900547.3QhRXtFmCM@sagittae>
Message-ID: <20170221142431.61d6e058@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 14:21:21 +0100, J?r?me Pouiller wrote:

> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU selects
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER, and
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER selects BR2_PACKAGE_MESA3D_DRIVER, so
> > I think it's good, no?  
> 
> You confuse BR2_PACKAGE_MESA3D_DRIVER and BR2_PACKAGE_MESA3D_DRI_DRIVER, no?

Yes, indeed. Sorry about the confusion :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
