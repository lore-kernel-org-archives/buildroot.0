From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:07:11 +0100
Subject: [Buildroot] [PATCH/next v2 1/3] package/libevdev: add
 host-python dependency
In-Reply-To: <20200302150907.5812-1-ps.report@gmx.net>
References: <20200302150907.5812-1-ps.report@gmx.net>
Message-ID: <20200305230711.1c8f78c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Mar 2020 16:09:05 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   checking for a Python interpreter with version >= 2.6... none
>   configure: error: no suitable Python interpreter found
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied to master. Ideally, I would have preferred to use
host-python3, since Titouan is working on making sure everything in
Buildroot builds properly with Python 3. However due to another issue
host-python3 is not self-sufficient: it doesn't build if Python3 is not
already installed on the build machine!

So, for now, I've applied your patch as-is to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
