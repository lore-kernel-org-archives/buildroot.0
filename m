From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:35:28 +0200
Subject: [Buildroot] [PATCH] Signed-off-by: Ian Haylock
 <haylocki@yahoo.co.uk>
In-Reply-To: <20191008200806.25257-1-haylocki@yahoo.co.uk>
References: <20191008200806.25257-1-haylocki@yahoo.co.uk>
Message-ID: <20191008223528.666d0839@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ian,

On Tue,  8 Oct 2019 21:08:06 +0100
haylocki at yahoo.co.uk wrote:

> From: Ian Haylock <haylocki@yahoo.co.uk>
> 
> package/python-rpi-gpio: bump version to 0.7.0

You have inverted the information in the commit log: the commit title
"package/python-rpi-gpio: bump version to 0.7.0" should have been the
first line, then a blank line, then your Signed-off-by line.

I have fixed this, and applied.

Could you send another patch that adds a hash of the LICENSE.txt file
in python-rpi-gpio.hash ? You can verify that it works by running "make
python-rpi-gpio-legal-info".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
