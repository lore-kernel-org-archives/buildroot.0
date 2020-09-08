From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 23:16:43 +0000
Subject: [Buildroot] [PATCH 5/5] Add support for Kendryte K210 based
 RISC-V boards
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-6-damien.lemoal@wdc.com>
 <20200908091728.6351079d@windsurf.hq.k.grp>
 <CY4PR04MB3751463068ACC779C758B3CDE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200908110714.6979f5c8@windsurf.hq.k.grp>
 <CY4PR04MB3751D91DFA061C4587F51EAFE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200908130806.0aa9df67@windsurf.hq.k.grp> <20200908122138.GB31727@lst.de>
Message-ID: <CY4PR04MB3751B9486519A94E4C3CED26E7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 21:21, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 01:08:06PM +0200, Thomas Petazzoni wrote:
>> Sounds good to me, I'm fine with a custom Busybox config file for the
>> time being. Perhaps justify that in the commit log so we have a trace
>> somewhere of why we accepted a custom Busybox config file.
> 
> Maybe give the busybox config a more generic name like initramfs-only
> to document the purpose?
> 

Yes, good idea. Will do that in addition to the commit message rewrite.

-- 
Damien Le Moal
Western Digital Research
