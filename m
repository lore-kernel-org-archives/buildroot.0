From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:13:30 +0100
Subject: [Buildroot] [PATCH V4] nvme: new package
In-Reply-To: <20160114110931.25590.46942.stgit@localhost.localdomain>
References: <20160114110931.25590.46942.stgit@localhost.localdomain>
Message-ID: <20160116141330.3af0deea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha Inamdar,

On Thu, 14 Jan 2016 16:42:40 +0530, Mamatha Inamdar wrote:
> Add support for building NVME utility - a utility for interacting with
> standard NVM Express (optimized PCI Express SSD interface) devices.
> 
> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> ---
>  package/Config.in      |    1 +
>  package/nvme/Config.in |    6 ++++++
>  package/nvme/nvme.hash |    2 ++
>  package/nvme/nvme.mk   |   23 +++++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100755 package/nvme/Config.in
>  create mode 100644 package/nvme/nvme.hash
>  create mode 100755 package/nvme/nvme.mk

Your patch does not apply:

Applying patch #567318 using 'git am -s -3'
Description: [V4] nvme: new package
Applying: nvme: new package
fatal: corrupt patch at line 72
error: could not build fake ancestor
Patch failed at 0001 nvme: new package
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Please make sure to use "git send-email" to submit your patch.

Also, you haven't included a patch that removes -Werror. Are you sure
the package builds properly? It wasn't building properly for me without
a patch removing -Werror.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
