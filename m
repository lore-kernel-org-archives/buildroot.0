From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 09:10:35 +0200
Subject: [Buildroot] [PATCH] linux: support multiple custom DTS files
In-Reply-To: <CAB4xu_2KTG7_JYQJPZ6GqPbLN1bjGf+s=A=qe8A_tCBaOQvn-g@mail.gmail.com>
References: <1406323532-18764-1-git-send-email-eeppeliteloop@gmail.com>
 <20140728223621.7ca59a2d@free-electrons.com>
 <CAB4xu_2KTG7_JYQJPZ6GqPbLN1bjGf+s=A=qe8A_tCBaOQvn-g@mail.gmail.com>
Message-ID: <20140729091035.3cc09911@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Mon, 28 Jul 2014 19:52:43 -0400, Philippe Proulx wrote:

> Well then you should also apply this to the help text of
> BR2_LINUX_KERNEL_INTREE_DTS_NAME because I just
> copied this as is to keep it consistent:
> 
> config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>   string "Device Tree Source file names"
>   depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
>   help
>     Name of the device tree source file, without
>     the trailing .dts. You can provide a list of
>     dts files to build, separated by spaces.

Sure, but that should be part of a separate patch. Maybe you just
volunteered to send such a patch? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
