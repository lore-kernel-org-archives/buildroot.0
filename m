From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:47:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/thermald: disable werror
In-Reply-To: <CAPi7W81dt63=ADrSpzzTQi1CkYp2DN1JB=Jf0PcgHM_5cQbreQ@mail.gmail.com>
References: <20200817183612.2826191-1-fontaine.fabrice@gmail.com>
 <20200817183612.2826191-2-fontaine.fabrice@gmail.com>
 <20200818164003.4a89e241@windsurf.home>
 <CAPi7W81dt63=ADrSpzzTQi1CkYp2DN1JB=Jf0PcgHM_5cQbreQ@mail.gmail.com>
Message-ID: <20200818234737.4d36d655@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Aug 2020 16:47:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Because, the patch fixing the build failure does not apply cleanly on
> current version.
> So, instead of backporting my patch, I thought it would be easier to
> bump to the latest official release.

Except we are now wait past -rc1, so we try to avoid merging version
bumps in master, otherwise we'll never manage to stabilize the master
branch.

So in this sort of situation, we want:

 - PATCH 1/2 that fixes the build issue, which we apply to master and
   next

 - PATCH 2/2 which does the version bump

Could you rework in this direction ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
