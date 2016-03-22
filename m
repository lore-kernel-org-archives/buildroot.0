From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:56:52 +0100
Subject: [Buildroot] [PATCH v2 5/7] altera: change mmcblk0 to sdc
In-Reply-To: <1445340745-1000-6-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-6-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160322235652.5a9328e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Oct 2015 13:32:23 +0200, Jan Viktorin wrote:
> It is not very common to have mmcblk0 device on the host PC,
> the previous text was quite confusing.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>

I think this is not true. On my PC right now:

 179        0    3813376 mmcblk0
 179        1    3813344 mmcblk0p1

So I believe this patch is not really necessary. Just
keep /dev/mmcblk0, the text is clear enough that this device might be
different on the user's system.

I've marked this one as Rejected in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
