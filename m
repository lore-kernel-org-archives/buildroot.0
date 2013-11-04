From: Wu, Aaron <Aaron.Wu@analog.com>
Date: Mon, 4 Nov 2013 01:12:22 +0000
Subject: [Buildroot] [PATCH] add no-mmu support for libglib-2.36.3
In-Reply-To: <20131101193302.0b7cb1b3@skate>
References: <1382375763-4150-1-git-send-email-aaron.wu@analog.com>
 <20131101193302.0b7cb1b3@skate>
Message-ID: <649EF91064D35D40B9C93A225BF4167461132376@NWD2MBX7.ad.analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Yes I will look into this and be back to you.

Regards,
Aaron

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: 2013?11?2? 2:33
To: Wu, Aaron
Cc: buildroot at busybox.net; Zhang, Sonic
Subject: Re: [Buildroot] [PATCH] add no-mmu support for libglib-2.36.3

Dear Aaron Wu,

On Tue, 22 Oct 2013 01:16:03 +0800, Aaron Wu wrote:
> Signed-off-by: Aaron Wu <aaron.wu@analog.com>
>
> add no-mmu support for libglib-2.36.3
> ---
>  package/libglib2/glib2.36.3_nommu.patch |  354 +++++++++++++++++++++++++++++++
>  1 file changed, 354 insertions(+)
>  create mode 100644 package/libglib2/glib2.36.3_nommu.patch

You received some feedback from Arnout on October, 22nd, but have not
responded to it. However, fixing the libglib build on Blackfin is
really important. Can you take into account Arnout's feedback and post
an updated version of the patch as appropriate?

Thanks a lot!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
