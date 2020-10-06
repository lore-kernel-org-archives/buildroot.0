From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 6 Oct 2020 22:58:05 +0000
Subject: [Buildroot] [PATCH v2 2/6] arch/config: Make RISC-V MMU optional
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-3-damien.lemoal@wdc.com>
 <20201006234654.5a205a05@windsurf.home>
Message-ID: <CY4PR04MB37513D4F3B627AFBD9FF103CE70D0@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/10/07 6:47, Thomas Petazzoni wrote:
> On Tue,  8 Sep 2020 20:33:20 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
>> to enable building for RISC-V boards that do not have one.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> I think this should come after PATCH 3 and PATCH 4, otherwise the build
> of the toolchain probably fails if you disable MMU support on RISC-V,
> doesn't it ?

Ah. Yes. It is probably better to move it after patch 4. I have not tested the
patches individually... Should have done that.

> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
