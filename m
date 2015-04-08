From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:53:36 +0200
Subject: [Buildroot] [PATCH] sh64: drop support for architecture
In-Reply-To: <20150407203101.GA14853@waldemar-brodkorb.de>
References: <20150407203101.GA14853@waldemar-brodkorb.de>
Message-ID: <20150408225336.0b046dac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 7 Apr 2015 22:31:01 +0200, Waldemar Brodkorb wrote:
> There seems to be no hardware or emulator available for this
> architecture. Someone from ST Microelectronics told me that
> sh64/sh5 projects are dropped over ten years ago.
> I found nothing about real hardware on the sites of Hitachi
> or Renesas.
> We should drop this.
> Support in uClibc-ng will be dropped in 1.1.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Following my and Peter comments, we'd prefer to see this feature to be
marked as deprecated. I've marked the patch as "Rejected" in patchwork.
Can you cook a patch simply marking sh64 as deprecated?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
