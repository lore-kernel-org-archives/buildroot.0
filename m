From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 7 Jul 2016 17:37:45 +0200
Subject: [Buildroot] [PATCH 1/1] Arcturus uCP1020 BSP support.
In-Reply-To: <1467900041-4422-1-git-send-email-oleks@arcturusnetworks.com>
References: <1467900041-4422-1-git-send-email-oleks@arcturusnetworks.com>
Message-ID: <20160707153745.GD20199@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Oleksandr,
Oleksandr G Zhadan wrote,

> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> System on Modules product featuring a Freescale P1020 CPU,
> optionally populated with 1 or 2 Gig-Ethernet PHYs,
> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
> 
> Signed-off-by: Oleksandr Zhadan <arcsupport@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> ---
>  .../ppc-ucp1020/configs/linux-4.1.x.config         | 2911 ++++++++++++++++++
>  .../arcturus/ppc-ucp1020/configs/uClibc-ng.config  |  243 ++

Is there a special need to add a separate uClibc-ng config?
What is wrong in the default one?

best regards
 Waldemar
