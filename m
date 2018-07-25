From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 18:25:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <5414fc7d-7041-f854-db5c-3b742f060daa@grinn-global.com>
References: <20180725123703.12826-1-m.niestroj@grinn-global.com>
 <20180725123703.12826-2-m.niestroj@grinn-global.com>
 <20180725180911.5952264a@windsurf>
 <5414fc7d-7041-f854-db5c-3b742f060daa@grinn-global.com>
Message-ID: <20180725182536.0c1ee5ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jul 2018 18:18:46 +0200, Marcin Niestroj wrote:

> > Is this needed only with the lvm2 bump to 2.02.180 ? Or is it needed
> > even with the current version of lvm2 we have packaged in Buildroot ?  
> 
> This is also needed for older version (currently packaged in Buildroot).

Then it should be PATCH 1/2 in your series, to make it clear that it is
needed today with the current version of lvm2 we have.

Is this fixing the following bug perhaps:
https://bugs.busybox.net/show_bug.cgi?id=10781 ? I would assume yes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
