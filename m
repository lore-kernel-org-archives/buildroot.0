From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 8 Mar 2019 00:11:56 +0200
Subject: [Buildroot] [PATCH] package/sunxi-tools: Fix build meminfo with
 musl
In-Reply-To: <20190307225857.68cc5b07@windsurf>
References: <20190303232340.23904-1-vadim4j@gmail.com>
 <20190307225857.68cc5b07@windsurf>
Message-ID: <20190307221156.gaxzlfbqh2c5p2do@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 07, 2019 at 10:58:57PM +0100, Thomas Petazzoni wrote:
> On Mon,  4 Mar 2019 01:23:40 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > musl does not provide inx/outx API for ARM arch, so use
> > io memory access via pointers which is actually done this
> > way in glibc/ulibc.
> > 
> > Fixes:
> >     http://autobuild.buildroot.net/results/bf10cbe40c0f672c34db72e4eea4c168d5932bd4/
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> 
> Applied to master, thanks. Could you please submit this patch
> upstream ? The project is on Github, so submitting a pull request is
> fairly trivial.
> 
> Thanks!

Already there:

    https://github.com/linux-sunxi/sunxi-tools/pull/122

Regards,
Vadim Kochan
