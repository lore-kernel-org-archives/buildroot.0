From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 17:12:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: Fix loop
 positional declaration build error
In-Reply-To: <1552923418-22447-1-git-send-email-email@gmail.com>
References: <1552923418-22447-1-git-send-email-email@gmail.com>
Message-ID: <20190318171237.032f635c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 17:36:58 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadim Kochan <vadim4j@gmail.com>
> 
> Move 'i' variable outside of the 'for' loop to separate declaration
> in lib/crc16.c
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/332c9d2232c03440bf71794ee7850b1f6fd51d11/
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Thanks for the fix, but I already submitted a similar one, and upstream
U-Boot wants to handle this different, see
https://lists.denx.de/pipermail/u-boot/2019-February/358821.html. I
didn't get to doing the change upstream U-Boot suggested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
