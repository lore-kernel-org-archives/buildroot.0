From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 14:36:54 +0200
Subject: [Buildroot] [PATCH 1/1] git: Fix libintl linking if there is no
 full gettext support
In-Reply-To: <CAMw6YJJPRP2qzXnCgLorqKBvhV7V3sAzZB4wrHJtHdP5Vy5MfQ@mail.gmail.com>
References: <20180824132049.20330-1-vadim4j@gmail.com>
 <20180824230917.20aaff8e@windsurf>
 <CAMw6YJKnyLbSO7FMf5ws5_vnEKS8TkZY1u_598YddvOm79J4GA@mail.gmail.com>
 <20180825141205.4c5c7667@windsurf>
 <CAMw6YJJPRP2qzXnCgLorqKBvhV7V3sAzZB4wrHJtHdP5Vy5MfQ@mail.gmail.com>
Message-ID: <20180825143654.7942a3dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 15:25:50 +0300, Vadim Kochan wrote:

> Sure! Thanks for the hint! I was also thinking about to just remove
> LIBC_CONTAINS_LIBINTL
> line from the config.mak.autogen file via $(SED), so this will
> indicate for the git's Makefile
> to add -lintl to the linker.

That is another option. I haven't looked in detail at the git build
system.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
