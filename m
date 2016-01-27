From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 27 Jan 2016 11:37:31 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160126142618.7ce66276@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com> <56A76066.10908@synopsys.com>
 <20160126142618.7ce66276@free-electrons.com>
Message-ID: <56A8ABFB.5030803@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Just checked and apparently MPlayer 1.2.x already supports AARCH64 so I think
the patch
https://git.busybox.net/buildroot/commit/?id=c93805207e24df082495f4d050bc2f29f3d19dd6
is no longer necessary.

On 1/26/2016 1:26 PM, Thomas Petazzoni wrote:
> Joao,
> 
> On Tue, 26 Jan 2016 12:02:46 +0000, Joao Pinto wrote:
> 
>> Could you tell me what changed in the Buildroot ecosystem to generate such "new"
>> errors?
> 
> So  you're talking about the mplayer failure on AArch64. I believe the
> main change that took place is that after you enabled it on AArch64,
> mplayer was bumped to version 1.2. Maybe the AArch64 build problem
> appeared with the bump to version 1.2.
> 
> Could you investigate if that's the case, if mplayer upstream already
> has a fix for the issue, and if not, see if the issue can be fixed
> easily ?
> 
> Thanks,
> 
> Thomas
> 

Thanks,
Joao
