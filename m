From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 09:55:28 +0100
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <20151118084517.GT9908@tarshish>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151116180724.GK9908@tarshish> <564AFD4E.2000301@imgtec.com>
 <20151118045051.GO9908@tarshish>
 <20151118092210.30ff22d2@free-electrons.com>
 <20151118084517.GT9908@tarshish>
Message-ID: <20151118095528.4dad4a0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 18 Nov 2015 10:45:17 +0200, Baruch Siach wrote:

> > I am not as clear-cut as you are on what is the correct thing to do
> > here, but your reasoning seems reasonable to me. So we need to align
> > the existing packages to do this, and also to use BR2_INIT_SYSTEMD in
> > Config.in (udisks uses BR2_PACKAGE_SYSTEMD). Will you send some patches
> > or should I do so?
> 
> I'll send the patches later. Would you like one patch per package, or a single 
> patch based on next?

I think a single patch is good enough, the number of affected packages
is pretty small.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
