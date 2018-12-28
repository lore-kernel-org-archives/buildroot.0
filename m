From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 10:21:47 +0100
Subject: [Buildroot] Building cargo with per-package directories
In-Reply-To: <20181227205015.GA27373@ned>
References: <20181211171252.02ddb571@windsurf> <20181211212705.GA13119@itchy>
 <20181212225041.GA15035@itchy>
 <20181226154959.6a793c8d@windsurf.home>
 <20181227205015.GA27373@ned>
Message-ID: <20181228102147.056d86ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 27 Dec 2018 21:50:15 +0100, Eric Le Bihan wrote:

> > so that if we ever change HOST_LDFLAGS in the future, it will continue
> > to work. What do you think ?  
> 
> I tested this change without issues, so I will post a patch to include
> it in the cargo package.

Thanks. In fact I already had a patch at
https://git.bootlin.com/users/thomas-petazzoni/buildroot/commit/?h=ppsh-v7-work&id=55c8e671d5130b22c72cedd194659c3dde5a6923,
but I will happily take an alternate patch if you have one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
