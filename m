From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 13 Apr 2018 10:22:11 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add dependency on
 elfutils for R600 with LLVM
In-Reply-To: <20180413101734.0ebdb28d@windsurf>
References: <20180412213200.3553280F77@busybox.osuosl.org>
 <CAGbXN6KP1_EoY+q0_y7OrE4kuuEmPOVA=G2BNSn_8NyqxbJtpA@mail.gmail.com>
 <20180413101734.0ebdb28d@windsurf>
Message-ID: <710376ec-ccd7-15ca-b8ff-25c86227427b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Michal,

Le 13/04/2018 ? 10:17, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Fri, 13 Apr 2018 10:16:19 +0200, Micha? Kalbarczyk wrote:
> 
>> Just figured out that you're creating a PR with gallium R600 driver. I'm
>> trying do the same thing with RADEONSI driver.
>> Can you add radeonsi driver to your PR, or should I create separate PR for
>> that ?
> 
> We don't do "PR" in Buildroot, we send patches over e-mail. I'm not
> sure Valentin has the hardware to test RadeonSI, so if you're
> interested by RadeonSI, please send your patches :-)

I confirm that Valentin doesn't have the hardware to test RadeonSI, me neither.
Michal, you're welcome to send patches to add RadeonSI support. I'll review them.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
