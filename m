From: daggs <daggs@gmx.com>
Date: Sun, 27 Nov 2016 22:36:46 +0100
Subject: [Buildroot] [PATCH] odroid-scripts: add support for auto resize
 on first boot for SYSV
In-Reply-To: <20161127222742.5a58f49c@free-electrons.com>
References: <20161127212449.14159-1-daggs@gmx.com>,
 <20161127222742.5a58f49c@free-electrons.com>
Message-ID: <trinity-2fcdc0f4-9fb1-4f65-8c09-14877a9c5f63-1480282606427@3capp-mailcom-bs07>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

>
> Hello,
> 
> On Sun, 27 Nov 2016 23:24:49 +0200, Dagg Stompler wrote:
> > ported from https://github.com/hardkernel/buildroot, upon first boot,
> > resize the file system to the max possible remaining size of the flash.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> This look potentially useful, but I don't see why it should be in an
> Odroid-specific package. It is independent of Odroid-specific hardware,
> so it should be in a separate package, so that it can be used on other
> platforms. Of course, it needs to be made generic enough so that other
> platforms can use it.

two reasons:
 1. this came from a Odroid-specific repo as stated above.
 2. afaics, the only way to make it more generic is to add systemd support and that is something I don't know how to do nor I have time to do so.

moreover, if it can be useful for other platforms, why not have it as part of the generated tree and not have it as a pkg?

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
