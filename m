From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 22:58:19 +0100
Subject: [Buildroot] [PATCH V9] package/nvme: new package
In-Reply-To: <20160214105817.12233.88403.stgit@localhost.localdomain>
References: <20160214105817.12233.88403.stgit@localhost.localdomain>
Message-ID: <20160216225819.3763b19f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha Inamdar,

On Sun, 14 Feb 2016 16:31:40 +0530, Mamatha Inamdar wrote:
> Add support for building NVME utility - a utility for interacting with
> standard NVM Express (optimized PCI Express SSD interface) devices.
> 
> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>

Thanks, applied to the next branch! I only fixed two minor things:

 * The author of the patch was just "Mamatha", which I changed to
   "Mamatha Inamdar"

 * I rewrapped the Config.in help text, the lines were too short.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
