From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 30 Oct 2017 00:07:42 +0300
Subject: [Buildroot] [PATCH v4 11/11] board: Add Orangepi Zero Plus2
	support
In-Reply-To: <1509041511-30956-12-git-send-email-jagan@amarulasolutions.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
 <1509041511-30956-12-git-send-email-jagan@amarulasolutions.com>
Message-ID: <CAFGfvX7P2Y3u2SqBE4r3Jetc82PUuwDUZncrK=hqnoq=9FAwXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Add initial support for Orangepi Zero Plus2 board with below features:
> - U-Boot 2017.09
> - Linux 4.13.7
> - Default packages from buildroot


I applied the whole patch series on top of the current buildroot and tried
orange-pi-zero-plus2. Build is ok, booting u-boot and kernel from SD card
is ok as well.
However later on kernel is not able detect SD card, while eMMC is properly
detected. As a result, boot never completes.  I guess SD cards in use should
not be a problem since my other boards (orange-pi-[zero|one]) work fine
with the same cards. s there anything I could miss ? Any DTS fixup maybe ?

Regards,
Sergey
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171030/9b380e57/attachment.html>
