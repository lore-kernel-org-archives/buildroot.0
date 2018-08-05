From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 11:58:41 +0200
Subject: [Buildroot] [PATCH 1/3] docs/manual: add flex+bison to
 pre-requisites
In-Reply-To: <20180805042552.kegqkwiff37nm4rh@sapphire.tkos.co.il>
References: <cover.1533333972.git.yann.morin.1998@free.fr>
 <e46b168daba5486329166279765dcbdb51bd3787.1533333972.git.yann.morin.1998@free.fr>
 <20180805042552.kegqkwiff37nm4rh@sapphire.tkos.co.il>
Message-ID: <20180805115841.4d08a1a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Aug 2018 07:25:52 +0300, Baruch Siach wrote:

> BTW, is version 2.95 realistic? Is it actually possible to build a reasonable 
> Buildroot config even with host gcc 3.x?

Hollis Blanchard recently started an autobuilder on RHEL6.5, which uses
host gcc 4.4, and sent some fixes for build issues encountered with
host gcc 4.4.

So, since this is the oldest gcc version that we're testing, I would
suggest that we document this version as the minimum gcc version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
