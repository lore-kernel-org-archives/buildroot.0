From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 27 Jan 2016 15:13:40 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160127160957.50558e3a@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com> <56A76066.10908@synopsys.com>
 <20160126142618.7ce66276@free-electrons.com> <56A8ABFB.5030803@synopsys.com>
 <20160127131616.281b5748@free-electrons.com> <56A8D359.30905@synopsys.com>
 <20160127160957.50558e3a@free-electrons.com>
Message-ID: <56A8DEA4.7050605@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

According to the MPlayer team, version 1.2.x already supports AARCH64, so there
is no sense on applying the patch for this new version.

On 1/27/2016 3:09 PM, Thomas Petazzoni wrote:
> Joao,
> 
> On Wed, 27 Jan 2016 14:25:29 +0000, Joao Pinto wrote:
> 
>> Wrong commit, sorry.
>> Please consider this one:
>> https://git.busybox.net/buildroot/commit/?id=1fc839e436a2a745bc7996545b1f60df5670df63
> 
> I still don't understand. The previous version of MPlayer was building
> fine for AArch64, so you enabled support for AArch64, which was good.
> 
> But now, because there is a regression on the new version of MPlayer
> which makes it fail to build on AArch64, you want to completely disable
> the MPlayer package for AArch64 ? It seems like a very strange
> solution. Instead, what about investigating the regression and fixing
> it ?
> 
> Thanks,
> 
> Thomas
> 

Joao
