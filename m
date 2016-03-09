From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 13:15:59 +0100
Subject: [Buildroot] [PATCH 1/2] Set PGROOT dir owner to be "postgres".
In-Reply-To: <20160309092148.GC14938@tkos.co.il>
References: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
 <20160307045142.GM2877@tarshish>
 <20160307092908.6334a90b@free-electrons.com>
 <20160309092148.GC14938@tkos.co.il>
Message-ID: <20160309131559.00ebe068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alan,

On Wed, 9 Mar 2016 11:21:49 +0200, Alan Yaniger wrote:

> I see what my error was. I installed the rootfs on my SSD by copying
> it from a partition on a USB-disk which I had mounted. Then I ran "cp"
> to copy from the mounted partition to the SSD, and I forgot to use the -p
> option to preserve attributes. When I installed after the "fix", I used "tar" to
> install, which preserved the ownership.

OK.

> I changed the state of the patch to "Rejected" in Patchwork.

Thanks for following up and changing the state of your patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
