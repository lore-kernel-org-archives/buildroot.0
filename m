From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 10:16:24 +0100
Subject: [Buildroot] [PATCH V2] NVME Makefile update
In-Reply-To: <20160120034712.7432.71222.stgit@localhost.localdomain>
References: <20160120034712.7432.71222.stgit@localhost.localdomain>
Message-ID: <20160120101624.5c41e419@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha Inamdar,

On Wed, 20 Jan 2016 09:19:41 +0530, Mamatha Inamdar wrote:
> Makefile cleanup: remove -Werror flag in CFLAGS
> 
> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>

Thanks, but this should be part of the patch adding the nvme package.
Could you please send a *single* patch that:

 - Adds package/nvme/ (with nvme.mk, nvme.hash *and*
   0001-NVME-Makefile-cleanup.patch)

 - Changes package/Config.in to include package/nvme/Config.in

Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
