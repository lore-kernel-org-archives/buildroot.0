From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:14:40 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix for linux 4.4
In-Reply-To: <CACeaM89dURUrB7frSMgMLg+tvbqM4YVwpaZiwLNHnm5=Kh=7nQ@mail.gmail.com>
References: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name>
 <87pox2yb5g.fsf@dell.be.48ers.dk>
 <CACeaM89dURUrB7frSMgMLg+tvbqM4YVwpaZiwLNHnm5=Kh=7nQ@mail.gmail.com>
Message-ID: <20160116141440.0924b24b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gerhard Heift,

On Fri, 15 Jan 2016 19:18:22 +0100, Gerhard Heift wrote:

> > Has this been fixed upstream? U-Boot 2016.01 is out, so if it is fixed
> > upstream then I would prefer to change the version instead.
> 
> No, this is not yet fixed in 2016-01.
> 
> > If it isn't upstream, please send the fix to the u-boot list first.
> 
> I sent this fix to the u-boot list too, but it since the list is
> moderated the mail is not yet approved by a moderater and therefor not
> yet public.

Are you sure the problem is not fixed by
http://git.denx.de/?p=u-boot.git;a=commit;h=69bf2d2fafe64349be3c3ef1256e3c68f812bb25,
which was merged as part of 2016.01 ? The problem description looks
really similar.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
