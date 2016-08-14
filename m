From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:16:33 +0200
Subject: [Buildroot] [PATCH 1/2] xen: Ensure host Python2 is used
In-Reply-To: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
References: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20160814161633.10f3a42d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Aug 2016 15:30:05 -0700, Alistair Francis wrote:
> To avoid Xen build issues ensure that host Python 2 is used.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  package/xen/xen.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
