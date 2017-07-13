From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 19:21:07 +0200
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
In-Reply-To: <d52a1493-e225-d781-71f8-97af8212ba77@arcturusnetworks.com>
References: <20170712183103.30139-1-oleks@arcturusnetworks.com>
 <20170713094219.1750fab7@windsurf.orange-hotspot.com>
 <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
 <20170713153809.5d51faba@windsurf.orange-hotspot.com>
 <d756418a-69f4-00a2-7aa1-e101a6289b1a@arcturusnetworks.com>
 <20170713173340.47f16bde@windsurf.lan>
 <d52a1493-e225-d781-71f8-97af8212ba77@arcturusnetworks.com>
Message-ID: <20170713192107.3d951b53@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 12:20:54 -0400, Oleksandr G Zhadan wrote:

> Looks like we mixed two architectures:
> 
> We have arcturus_ucp1020_defconfig (board/arcturus/ppc-ucp1020) already 
> in buildroot tree for a while and we been using public kernel with our 
> patches.
> Recently I tested the build of it and found that with latest GCC-6 we 
> have an issue to build image for this existing board (uCP1020), but it 
> was building OK when the latest was GCC-4.9.  I agree with you that it 
> is better to port GCC-6 issue fix and use GCC-6, I already tested it 
> here and will added that linux-3.18 patch  into my board patch directory.
> The updated patch for uCP1020 I will send soon.
> 
> The arcturus_ucls1012a_defconfig (board/arcturus/aarch64-ucls1012a) is 
> another board support package we are trying to add to buildroot now.
> And in patches for this board we are using 
> "BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a-170706-13.tar.gz".
> The v4 of the patch for uCLS1012a is waiting for your approval.

Indeed, I got confused by the two defconfigs. Thanks for clarifying the
situation!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
