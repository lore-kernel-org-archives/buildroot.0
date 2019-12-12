From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:45:42 +0100
Subject: [Buildroot] [PATCH 0/4] package/xenomai: Fixes, updates,
 enhancements
In-Reply-To: <cover.1576176280.git.jan.kiszka@siemens.com>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
Message-ID: <20191212214542.35e7b751@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Thu, 12 Dec 2019 19:44:36 +0100
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> Just a couple of improvements I came across while building me a virtual
> ppc32 test target.
> 
> Jan
> 
> PS: @CC, sorry, had to send twice as the list is not open.

Thanks a lot for sending those patches, it's nice to see patches from
you on our Xenomai package! I have a few comments/questions on the
patches, I'll reply individually to the patches.

> Jan Kiszka (4):
>   package/xenomai: Smokey's not a skin
>   package/xenomai: Pull from git
>   package/xenomai: Bump version to 3.0.10
>   package/xenomai: Clean up wrappers cleanup

A minor nit: we typically don't capitalize commit titles in Buildroot,
i.e "pull from git" and not "Pull from git". I know, that's arbitrary,
people like it one way or the other, we simply have more or less a
convention.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
