From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 23:18:15 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libffi: fix build failure
 with powerpc7
In-Reply-To: <20a72d62-aecb-be18-9bb7-2f69115e14ba@mind.be>
References: <20191124090305.1015485-1-fontaine.fabrice@gmail.com>
 <20a72d62-aecb-be18-9bb7-2f69115e14ba@mind.be>
Message-ID: <20191210231815.5756578e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 3 Dec 2019 23:53:06 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 24/11/2019 10:03, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
>  Upstream merged a different fix [1] which TBH doesn't look as good... Could you
> check with upstream what is the better solution?
> 
>  Regards,
>  Arnout
> 
> [1]
> https://github.com/libffi/libffi/pull/532/commits/2138adb2a5b6a0bc2fe3518e0645eacc89b6f392

Fabrice, have you had the chance to check with upstream what is the
most correct fix?

Also, your commit title says it fixes it for powerpc7, but the issue
also appears with older powerpc platforms, and indeed the upstream
commit says it fixes the issue for powerpc7 and older platforms.

Since the issue pops up quite a lot in the autobuilders, it would be
nice if we could finalize this patch and merge it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
