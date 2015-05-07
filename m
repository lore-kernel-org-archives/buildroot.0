From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 May 2015 09:25:32 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: enable context functions
In-Reply-To: <20150507040116.GR8309@waldemar-brodkorb.de>
References: <20150506175030.GA2853@waldemar-brodkorb.de>
 <20150506212318.6025af52@free-electrons.com>
 <20150507040116.GR8309@waldemar-brodkorb.de>
Message-ID: <20150507092532.57cd58ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Thu, 7 May 2015 06:01:16 +0200, Waldemar Brodkorb wrote:

> > We don't have this option enabled in uClibc-0.9.33.config. Should I
> > assume that it's because this option doesn't exist in the 0.9.33.x
> > uClibc branch?
> 
> Right, it was added later:
> http://git.uclibc.org/uClibc/commit/extra/Configs/Config.in?id=a8dc90eaaa5e6474beac828558d969b1aafee4af

Ok, thanks.

> > Also, why don't we have this option enabled in uClibc-snapshot.config?
> 
> I don't know how often this file get updated?

I'd say quite regularly, since it is used for the ARC and Xtensa builds.

Can you send an updated version of your patch that also updates
uClibc-snapshot.config ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
