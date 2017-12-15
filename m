From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:29:46 +0100
Subject: [Buildroot] [PATCH v4] solidrun/macchiatobin: add new board
In-Reply-To: <20171209121720.14701-1-geomatsi@gmail.com>
References: <20171209121720.14701-1-geomatsi@gmail.com>
Message-ID: <20171215092946.3bcc879d@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Dec 2017 15:17:20 +0300, Sergey Matyukevich wrote:
> Add MacchiatoBin board by SolidRun. This board is based on Marvell
> Armada 8040 SoC. Board support package includes the following
> two options: mainline and vendor BSPs.
> 
> Mainline BSP:
> - Marvell ATF v1.3-armada-17.10
> - mainline U-Boot v2017.11
> - mainline Linux kernel v4.14.4
> 
> Marvell BSP with more hardware support enabled:
> - Marvell ATF v1.3-armada-17.10
> - Marvell U-Boot based on v2017.03
> - Marvell Linux kernel based v4.4.52
> 
> More details about this board are available on wiki:
> - http://wiki.macchiatobin.net
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> ---

I've applied after doing a number of tweaks to the readme.txt file, and
updating the .gitlab-ci.yml file.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
