From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 20:15:50 +0200
Subject: [Buildroot] [PATCH] sam-ba: use correct host arch binary for
 sam-ba symlink
In-Reply-To: <689868d9-5d05-6fac-f186-c891a1cba705@microchip.com>
References: <1521735866-15288-1-git-send-email-joshua.henderson@microchip.com>
 <20180325222519.2d36d2f4@windsurf>
 <689868d9-5d05-6fac-f186-c891a1cba705@microchip.com>
Message-ID: <20180326201550.05b36bc9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 11:10:32 -0700, Joshua Henderson wrote:

> I have something in this direction in progress.  I just have to
> finish up reconciling the update to sam-ba 3.x with things like
> board/atmel/flasher.sh.  I'm not sure what that means yet.  Should
> flasher.sh stick around?

It doesn't have to, as long as there is some reasonable details in
board/atmel/readme.txt that explains who to flash the boards.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
