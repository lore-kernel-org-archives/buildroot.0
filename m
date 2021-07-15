From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 15 Jul 2021 22:51:23 +0200
Subject: [Buildroot] [PATCH] configs/stm32mp157a_dk1: bump TF-A, Linux,
 U-Boot versions
In-Reply-To: <20210715223645.4930fc60@windsurf>
References: <20210709192156.8030-1-texier.pj2@gmail.com>
 <20210715223645.4930fc60@windsurf>
Message-ID: <0db7f843-2d9f-6a3e-c1cc-aac78e0febbb@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Thomas,

Le 15/07/2021 ? 22:36, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Fri,  9 Jul 2021 21:21:56 +0200
> Pierre-Jean Texier <texier.pj2@gmail.com> wrote:
> 
>>   configs/stm32mp157a_dk1_defconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks. However, could you sync with Sergey
> Matyukevich <geomatsi@gmail.com> and ensure that the DK1 and DK2
> configurations are aligned in terms of TF-A/U-Boot/Linux versions ?

Thanks for the feedback, you're indeed right, fixed in [1]
> 
> Also, could you drop the U-Boot config fragment related to the
> watchdog, like Sergey did for the DK2 ?

Sure, fixed in [2].

Thanks !

[1] - 
http://patchwork.ozlabs.org/project/buildroot/patch/20210715204746.22089-2-texier.pj2 at gmail.com/
[2] - 
http://patchwork.ozlabs.org/project/buildroot/patch/20210715204746.22089-1-texier.pj2 at gmail.com/
-- 
Pierre-Jean Texier
