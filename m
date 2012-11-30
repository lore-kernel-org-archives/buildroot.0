From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 20:57:15 +0100
Subject: [Buildroot] [PATCH 17/33] matchbox packages: fix broken urls
In-Reply-To: <87fw3rayff.fsf@dell.be.48ers.dk>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-18-git-send-email-s.martin49@gmail.com>
 <87fw3rayff.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMML9f9eM7odmYWDrztZeK_ivwNeZDz5LWFMbhRV_xxFagg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/30 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
[...]
>  Samuel> -MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
>  Samuel> +MATCHBOX_COMMON_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
>
> Hmm, projects.o-hand.com doesn't seem to exist?
At least, it did...

>
> host -a projects.o-hand.com
> Trying "projects.o-hand.com"
> Received 105 bytes from 64.71.0.60#53 in 59 ms
> Trying "projects.o-hand.com"
> Host projects.o-hand.com not found: 3(NXDOMAIN)
Indeed... it seems pretty down :-(

Luckily, by the time this patch tried to be merged it got down!

Well, I'll switch to some alive location and repost.


Regards,

-- 
Sam
