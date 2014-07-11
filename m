From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 09:58:32 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux target name might be not equal
 linux file name
In-Reply-To: <20140710200054.GA29977@waldemar-brodkorb.de>
References: <20140710200054.GA29977@waldemar-brodkorb.de>
Message-ID: <20140711095832.064f1050@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Thu, 10 Jul 2014 22:00:54 +0200, Waldemar Brodkorb wrote:
> For example the upcoming qemu-xtensa patch is using this feature,
> where the target is called "zImage", but the resulting kernel name
> is "Image.elf".

Could you improve a bit the title of your commits? The title should
always be:

 <area>: <short description>

Where <area> is generally the name of the package being affected. In
this case, it should be:

 linux: add option to explicitly specify the kernel image name

For your qemu-system-xtensa defconfig, it should be something like:

 configs: add new configuration for qemu-system-xtensa

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
