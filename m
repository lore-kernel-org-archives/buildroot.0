From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 10:27:21 +0100
Subject: [Buildroot] Trouble bringing up Raspberry Pi
In-Reply-To: <20151219201126.GA9718@buinea.com>
References: <20151219201126.GA9718@buinea.com>
Message-ID: <20151220102721.16b3d82b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve,

On Sat, 19 Dec 2015 12:11:26 -0800, Steve Morris wrote:

> Perhaps a working .config for the Pi B+ would set me in the right
> direction.

Did you try:

	make raspberrypi_defconfig
	make

And then read the instructions in board/raspberrypi/readme.txt ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
