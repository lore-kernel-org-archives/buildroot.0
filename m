From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:04:40 +0200
Subject: [Buildroot] [PATCH] uclibc: proper thread default on m68k and
 Microblaze
In-Reply-To: <20160807201552.GG5855@free.fr>
References: <1470414941-29826-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160807201552.GG5855@free.fr>
Message-ID: <20160807230440.76f3a30a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Aug 2016 22:15:52 +0200, Yann E. MORIN wrote:

> And to make things even more simple, why not move NPTL first, then LT,
> then none, and remove the default?

Correct, I've changed the patch with this idea and applied. Thanks for
the suggestion!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
