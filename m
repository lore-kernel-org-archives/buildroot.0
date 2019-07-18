From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 20:30:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20190717220215.27168-1-fontaine.fabrice@gmail.com>
References: <20190717220215.27168-1-fontaine.fabrice@gmail.com>
Message-ID: <20190718203039.48135215@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 18 Jul 2019 00:02:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> hiawatha uses __sync_add_and_fetch_ 4 and __sync_sub_and_fetch_4
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/396f3ec849229eea9298215fbb1e1aac9f48c677
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It would be nice to have more context about why the problem is suddenly
happening. In this case, it's due to the bump to v10.9.

So I've added more details in the commit log and applied. But generally
speaking, when there is a build failure, it is always good to see since
when it happens, and not just to fix the immediate problem, but to see
if there is a reason for suddenly having build failures that were not
occurring in the past.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
