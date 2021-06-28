From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jun 2021 22:20:32 +0200
Subject: [Buildroot] Can I apply a patch to a board directory?
In-Reply-To: <PAXP193MB13111B9097B4B275BB4DD49D9B039@PAXP193MB1311.EURP193.PROD.OUTLOOK.COM>
References: <PAXP193MB13111B9097B4B275BB4DD49D9B039@PAXP193MB1311.EURP193.PROD.OUTLOOK.COM>
Message-ID: <20210628222032.1afe9e9d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jun 2021 18:26:04 +0200
philip <philip286@live.com> wrote:

> I need to change a few lines in 
> board/raspberrypi/genimage-raspberrypi4-64.cfg. Can this be achieved via 
> a patch?

No, this is not possible. Just a different genimage configuration file
in your configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
