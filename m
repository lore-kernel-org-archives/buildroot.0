From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:51:27 +0200
Subject: [Buildroot] [PATCH 0/2] Odroid XU4 support
In-Reply-To: <1466950062-31783-1-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
Message-ID: <20160626215127.053ba7b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andi!

On Sun, 26 Jun 2016 17:07:40 +0300, Andi Shyti wrote:

> this patchset adds support for the Odroid XU4 board.
> 
> The first patch adds the first two stages of boot firmare and the
> trust zone, necessary to boot the device.
> 
> While the second patch adds the actual support of the board.

Thanks for this contribution, it's very useful to have support for
such platforms. I have some comments though, so I'll reply to the
individual patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
