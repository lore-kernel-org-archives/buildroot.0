From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 14:23:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <a1a068d8-514c-d454-18b4-6d897b8f4db5@grinn-global.com>
References: <20180725123703.12826-1-m.niestroj@grinn-global.com>
 <20180725123703.12826-2-m.niestroj@grinn-global.com>
 <20180725180911.5952264a@windsurf>
 <5414fc7d-7041-f854-db5c-3b742f060daa@grinn-global.com>
 <20180725182536.0c1ee5ef@windsurf>
 <b332421e-78bc-d9fb-922e-4ac08a39692a@grinn-global.com>
 <a1a068d8-514c-d454-18b4-6d897b8f4db5@grinn-global.com>
Message-ID: <20180726142326.342bad56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 13:13:36 +0200, Marcin Niestroj wrote:

> Patch does not apply cleanly on 2.02.173 (current Buildroot). However it
> is easy to adjust patch for that version. Do you still want to make it
> PATCH 1/2 and then adjust it in PATCH 2/2 "package/lvm2: bump to
> version 2.02.180" ?

Yes, because we want to be able to backport the fix to our LTS branch.
So the fix should be PATCH 1/2 and the bump should be PATCH 2/2, even
if doing the bump requires adjusting the patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
