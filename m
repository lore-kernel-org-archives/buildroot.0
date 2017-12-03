From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 22:51:10 +0100
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
In-Reply-To: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171203225110.319cc00e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 19:05:42 +0100, Jagan Teki wrote:

> Jagan Teki (11):
>   arm-trusted-firmware: Build FIP for BL33
>   uboot: Add U-Boot-bundles-ATF support

Since I was not super happy with this proposal to solve the ATF/U-Boot
building problem for Allwinner A64/H5, I just submitted a different
patch series (which re-uses some of your work, authorship preserved).
Could you see what you think about my proposal ?

See:

 http://lists.busybox.net/pipermail/buildroot/2017-December/208788.html

>   board: Add Bananapi M64 support
>   board: Add Pine64 support
>   board: Add SoPine support
>   board: Add FriendlyARM Nanopi A64 support
>   board: Add FriendlyARM Nanopi NEO2 support
>   board: Add Olimex A64-OLinuXino support
>   board: Add Orangepi Win/Win Plus support
>   board: Add Orangepi Prime support
>   board: Add Orangepi Zero Plus2 support

If my proposal gets merged, then it would be nice if you could rebase
your defconfig patches on top of it. It's mainly a matter of adding a
few more ATF options and tweaking U-Boot options.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
