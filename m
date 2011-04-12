From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Tue, 12 Apr 2011 08:42:04 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de>
	<BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
Message-ID: <1302590524.4891.196.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cut]
> Buildroot has a quirk: the rootfs skeleton is copied to the target dir
> only once(!). If you change any files in ./fs/skeleton (or your custom
> path) you have to do "make clean" and start over (or hack the
> Makefile, around line 420...).
It's not a quirk. I always thought its designed like that. You should
work and modify files in directory buildroot/output/target, shouldn't
you?

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
