From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 17:33:40 +0200
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
In-Reply-To: <d756418a-69f4-00a2-7aa1-e101a6289b1a@arcturusnetworks.com>
References: <20170712183103.30139-1-oleks@arcturusnetworks.com>
 <20170713094219.1750fab7@windsurf.orange-hotspot.com>
 <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
 <20170713153809.5d51faba@windsurf.orange-hotspot.com>
 <d756418a-69f4-00a2-7aa1-e101a6289b1a@arcturusnetworks.com>
Message-ID: <20170713173340.47f16bde@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 10:14:41 -0400, Oleksandr G Zhadan wrote:

> > Then could you please backport Linux kernel commit
> > 1e407ee3b21f981140491d5b8a36422979ca246f instead? It should fix this
> > build issue.  
> 
> Yes, I can, but we are using public kernel.

Well, the kernel is downloaded from:

+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a-170706-13.tar.gz"

and you work for Arcturus Networks, so I guess you could adjust your
tarball to include the relevant patch, no?

> Should I add it as an extra patches to my 
> board/arcturus/ppc-ucp1020/patches/linux/ directory ?

If changing the tarball is not possible, then adding the patch in
Buildroot is indeed the other option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
