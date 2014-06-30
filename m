From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 12:17:35 +0200
Subject: [Buildroot] Drivers for Realtek WLAN dongles
In-Reply-To: <53B12F66.7010508@relinux.de>
References: <53B12F66.7010508@relinux.de>
Message-ID: <20140630121735.41fa221b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Mon, 30 Jun 2014 11:35:34 +0200, Stephan Hoffmann wrote:

> did anyone download and compile drivers from realtek's website using
> buildroot?
> 
> While
> http://www.armadeus.com/wiki/index.php?title=USB_to_WiFi_adapter#Chipset_RTL8188CUS
> gives a recipe to do this by hand I need an integration in buildroot for
> my current project.
> 
> I searched the web but did not find anything, but maybe someone has a
> not yet published solution. If not I will start my own patchset for this.

Are you sure you need an out-of-tree driver for this? I see the
mainline rtlwifi driver supports a number of rtl8188cus dongles. Which
specific model do you have? Which USB vendor/product ID?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
