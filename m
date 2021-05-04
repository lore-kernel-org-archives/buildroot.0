From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 May 2021 22:35:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/imx-gpu-viv:
 select libdrm
In-Reply-To: <YJFERG3iJa1m2VyV@p1g2>
References: <20210429185138.4460-1-sebastien.szymanski@armadeus.com>
 <YJFERG3iJa1m2VyV@p1g2>
Message-ID: <47a8563f-8bf3-d448-ea95-3e7d810aec38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/05/2021 14:55, Gary Bisson wrote:
> Hi S?bastien,
> 
> On Thu, Apr 29, 2021 at 08:51:38PM +0200, S?bastien Szymanski wrote:
>> Some libraries (libGL.so, vivante_dri.so, libEGL.so, libgbm_viv.so) are
>> linked against libdrm so select libdrm package.
>>
>> Fixes: 8283e838f040 ("package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p1.2")
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

 Applied to master, thanks.


> 
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> Tested on Nitrogen8MP + fb backend, confirm that Vivante examples run
> fine! Thanks for pointing it out!

 Thanks for testing!

 Regards,
 Arnout

> 
> Regards,
> Gary
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
