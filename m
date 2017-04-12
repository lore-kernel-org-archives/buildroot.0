From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:12:30 +0200
Subject: [Buildroot] [PATCH V2] package/xen: Update to version 4.8.1
In-Reply-To: <20170412145413.13731-1-alistair.francis@xilinx.com>
References: <20170412145413.13731-1-alistair.francis@xilinx.com>
Message-ID: <20170412211230.5661d2f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 07:54:13 -0700, Alistair Francis wrote:
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
> Changes from package/xen: Update to version 4.8.0 V3
>  - Don't edit the HOST_EXTRACFLAGS inside the Xen build system
>  - Don't change TARGET_CONFIGURE_OPTS
>     - Instead of the above two we hardcode: HOST_EXTRACFLAGS="-Wno-error" 
>  - Update to Xen 4.8.1 instead of 4.8.0

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
