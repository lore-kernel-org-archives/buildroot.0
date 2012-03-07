From: Attila Kinali <attila@kinali.ch>
Date: Wed, 7 Mar 2012 12:04:55 +0100
Subject: [Buildroot] Building a kernel for i.MX23 (and probably other
 from the i.MX family)
In-Reply-To: <20120307114528.0304fc3d8061b683b66c7230@kinali.ch>
References: <20120307114528.0304fc3d8061b683b66c7230@kinali.ch>
Message-ID: <20120307120455.ce07a1cc259008856b4884c7@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 7 Mar 2012 11:45:28 +0100
Attila Kinali <attila@kinali.ch> wrote:

> $ make -C linux_prep ARCH=mx23 BOARD=stmp378x_dev
> CROSS_COMPILE=arm-linux- $ make -C boot_prep  ARCH=mx23
> BOARD=stmp378x_dev CROSS_COMPILE=arm-linux- $ make -C power_prep
> ARCH=mx23 BOARD=stmp378x_dev CROSS_COMPILE=arm-linux- $ elftosb2 -z
> -c ./linux.db -o imx23_linux.sb


Humpf... Grabbled linebreaks...

Here again:

$ make -C linux_prep ARCH=mx23 BOARD=stmp378x_dev \
 CROSS_COMPILE=arm-linux- 
$ make -C boot_prep  ARCH=mx23 BOARD=stmp378x_dev \
 CROSS_COMPILE=arm-linux-
$ make -C power_prep ARCH=mx23 BOARD=stmp378x_dev \
 CROSS_COMPILE=arm-linux- 
$ elftosb2 -z -c ./linux.db -o imx23_linux.sb


			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
		-- Tirin, The Dispossessed, U. Le Guin
