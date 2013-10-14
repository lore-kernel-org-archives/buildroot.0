From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 19:33:12 +0200
Subject: [Buildroot] [PATCHv3] beaglebone: add BeagleBone Black support
In-Reply-To: <CACG401qNSaRhMFhhmz3w55So+YT_7e-APcaw-Nwm82sP0muBKA@mail.gmail.com>
References: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
 <CACG401qNSaRhMFhhmz3w55So+YT_7e-APcaw-Nwm82sP0muBKA@mail.gmail.com>
Message-ID: <20131014193312.6b20bda3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jesse Cobra,

On Mon, 14 Oct 2013 13:29:41 -0400, Jesse Cobra wrote:

> One quick question as the device tree stuff is new to me. Do I need to
> manually put the correct dtb file for BBB and BB_white respectively on
> /uSD/boot/*.dtb or does the system have a way to pick the correct dtb file
> for each platform during boot time?
> 
> To restate, I cant just put both am335x-bone.dtb & am335x-boneblack.dtb on
> /boot can I?

All this logic is done by the U-Boot scripts integrated in the U-Boot
environment, so you'll have to look at these scripts to see which DTB
they load at boot time. You can of course adjust these scripts to
ensure they load the right DTB.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
