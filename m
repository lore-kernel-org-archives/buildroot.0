From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:37:08 +0200
Subject: [Buildroot] [PATCH 2/2] mtd: integck needs MMU support
In-Reply-To: <1470847117-14956-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1470847117-14956-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160810223708.0ab57981@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 22:08:37 +0530, Rahul Bedarkar wrote:
> After fixing build issue related to MS_DIRSYNC and MS_RELATIME, we get
> following build error with blackfin external toolchain.

So it is really worth the effort merging PATCH 1/2 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
