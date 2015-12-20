From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:40:59 +0100
Subject: [Buildroot] Trouble bringing up Raspberry Pi
In-Reply-To: <20151220133618.GA8906@buinea.com>
References: <20151219201126.GA9718@buinea.com>
 <20151220102721.16b3d82b@free-electrons.com>
 <20151220133618.GA8906@buinea.com>
Message-ID: <20151220144059.4099ee63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Dec 2015 05:36:18 -0800, Steve Morris wrote:

> Thank you for the response. 
> 
> Yes, I followed those instructions at least a  couple of times for both
> volatile and persistent root.
> 
> It hung during boot until I added the mdev selection.

When does it hang? It definitely shouldn't hang. Are you using the
serial port of your RPi to get the bootloader/kernel/initialization
messages ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
