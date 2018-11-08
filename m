From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:07:16 +0100
Subject: [Buildroot] [PATCH 1/4] fs/f2fs: clarify help messages
In-Reply-To: <20181106140647.18251-1-grzegorz@blach.pl>
References: <20181106140647.18251-1-grzegorz@blach.pl>
Message-ID: <20181108210716.79bacfcb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for following up on this f2fs support!

On Tue,  6 Nov 2018 15:06:44 +0100, Grzegorz Blach wrote:

> +	  Leave at 0 for autocalculation accoring to the partition

					 ^^^^^ according

I've fixed this typo, both in the patch and in the commit log, and I've
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
