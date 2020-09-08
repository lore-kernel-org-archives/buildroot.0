From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 06:00:45 +0000
Subject: [Buildroot] [PATCH 3/5] package/elf2flt: add RISC-V support
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-4-damien.lemoal@wdc.com>
 <20200908053821.GA13505@lst.de>
Message-ID: <CY4PR04MB3751C5B1065442D7E488D49CE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 14:38, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 02:16:22PM +0900, Damien Le Moal wrote:
>> From: Christoph Hellwig <hch@lst.de>
>>
>> Enable selecting elf2flt for RISC-V no MMU builds ad add support for it.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Cn we try to upstream the elf2flt changes first?  Sorry, I should have
> probably done that long time ago..
> 

Yes. Will send that out too. Same for the uClibc build fixes (currently, static
builds with gcc10 are totally broken though).


-- 
Damien Le Moal
Western Digital Research
