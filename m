From: daggs <daggs@gmx.com>
Date: Fri, 23 Dec 2016 14:43:41 +0100
Subject: [Buildroot] [PATCH 2/2] odroidc2: use first boot fs resize pkg.
In-Reply-To: <20161217165123.1053e588@free-electrons.com>
References: <20161202101028.26736-1-daggs@gmx.com>
 <20161202101028.26736-2-daggs@gmx.com>,
 <20161217165123.1053e588@free-electrons.com>
Message-ID: <trinity-82c86be7-f597-4daf-9eb8-69263b5bb315-1482500621030@3capp-mailcom-bs05>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Fri,  2 Dec 2016 12:10:28 +0200, Dagg Stompler wrote:
> > remove the hardcode limitation of the created rootfs parition size and
> > use the newly added first boot fs resize pkg to extend the fs to the max
> > possible.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> I think we want to decide if we want to do this globally for all
> defconfig for which it makes sense. Having that just for one defconfig,
> but not all the other is a bit weird. Being consistent is quite
> important.
imho the first stage should be for the original board it was indented to, then extend it.
as I don't have other measures to test it, I didn't want to set it globally.

Dagg.

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
