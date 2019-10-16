From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:46:08 +0200
Subject: [Buildroot] [PATCH] package/qemu: bump to a hot-fix release
 3.1.1.1
In-Reply-To: <20191015154104.13171-1-abrodkin@synopsys.com>
References: <20191015154104.13171-1-abrodkin@synopsys.com>
Message-ID: <20191016214608.3f8cd401@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 18:41:04 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Fixes a couple of important things and among other things pvrdma
> compila:
> ----------------------->8---------------------  
>   In function 'create_qp':
>   hw/rdma/vmw/pvrdma_cmd.c:517:16: error: 'rc' undeclared
> ----------------------->8---------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
