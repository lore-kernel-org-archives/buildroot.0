From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 12:27:41 +0200
Subject: [Buildroot] [PATCH 2/2] logrotate: fix up build error with gcc 6
In-Reply-To: <57B69CBE.2040305@imgtec.com>
References: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471539849-3766-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20160818212125.1cb8e7ae@free-electrons.com>
 <57B69CBE.2040305@imgtec.com>
Message-ID: <20160819122741.6a2890e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 11:14:30 +0530, Rahul Bedarkar wrote:

> > Indeed PATCH 2/2 being a bug fix, it would be a candidate for the
> > "master" branch, while PATCH 1/2 being a version bump, we can only
> > commit it to the "next" branch.  
> 
> In that case, I will spin v2 of this patch and backport upstream commit 
> to fix second build error.

OK, thanks. I've marked both of your patches as Changes Requested, so
please send a series with two patches:

 * One patch that adds the necessary fixes for the gcc 6.x build, which
   can be applied on master.

 * One patch that bumps the version of lograte to the latest one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
