From: Steve Morris <morris@buinea.com>
Date: Sun, 20 Dec 2015 05:36:18 -0800
Subject: [Buildroot] Trouble bringing up Raspberry Pi
In-Reply-To: <20151220102721.16b3d82b@free-electrons.com>
References: <20151219201126.GA9718@buinea.com>
 <20151220102721.16b3d82b@free-electrons.com>
Message-ID: <20151220133618.GA8906@buinea.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thank you for the response. 

Yes, I followed those instructions at least a  couple of times for both
volatile and persistent root.

It hung during boot until I added the mdev selection.

I was able to get keyboard input working by loading the hid-microsoft
module  ( microsoft USB keyboard ), but I was assuming a minimal system
could read a generic USB keyboard.

I'll try it again from scratch and see if I have better results.

Steve






On Sun, Dec 20, 2015 at 10:27:21AM +0100, Thomas Petazzoni wrote:
> Steve,
> 
> On Sat, 19 Dec 2015 12:11:26 -0800, Steve Morris wrote:
> 
> > Perhaps a working .config for the Pi B+ would set me in the right
> > direction.
> 
> Did you try:
> 
> 	make raspberrypi_defconfig
> 	make
> 
> And then read the instructions in board/raspberrypi/readme.txt ?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
