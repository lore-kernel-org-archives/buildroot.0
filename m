From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:29:28 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 10.5
In-Reply-To: <CAFSsvmpkvmmF-DbbJ8Uj=JUyJ=dg8AFwPg7K21Za=ao98N2nNw@mail.gmail.com>
References: <20180828163127.9989-1-aduskett@gmail.com>
 <CAFSsvmpkvmmF-DbbJ8Uj=JUyJ=dg8AFwPg7K21Za=ao98N2nNw@mail.gmail.com>
Message-ID: <20180828222928.0b8c1fb3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Tue, 28 Aug 2018 12:36:08 -0400, Adam Duskett wrote:

> I would recommend that this patch should be applied to master, next,
> and 2018.02.x

In fact, it goes just to master.

next will be merged back into master as soon as 2018.08 is released. We
don't apply changes to both master and next, unless it is needed to
resolve conflicts. master takes all the bug/build/security fixes, next
takes all the rest of the development.

The patch will be applied on 2018.02.x and 2018.05.x by Peter as part
of his process of reviewing all commits that were made in master, and
deciding which ones are relevant for our stable branches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
