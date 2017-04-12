From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 10:04:52 +0200
Subject: [Buildroot] [PATCH] package/xen: Update to version 4.8.1
In-Reply-To: <20170411214803.5948-1-alistair.francis@xilinx.com>
References: <20170411214803.5948-1-alistair.francis@xilinx.com>
Message-ID: <20170412100452.06a8eebb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 14:48:03 -0700, Alistair Francis wrote:
> Update Xen to version 4.8.1 and update the patches to allow Xen
> hypervisor and Xen tools to build.
> 
> The patches applied were re-aranged a little bit. Patches 2, 3 and 4
> have been accepted by upstream Xen and won't be required in future
> releases.
> 
> Patch 1 (previously patch 2) is still required and was moved to patch 1
> to better reflect it's status.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---

Thanks for this new patch. However, it's missing a version number and a
changelog compared to the previous iteration, so I don't know what
changed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
