From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 09:40:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-12-27
In-Reply-To: <87sg7q8hh7.fsf@tarshish>
References: <20201228081344.55D67861C5@fraxinus.osuosl.org>
 <87sg7q8hh7.fsf@tarshish>
Message-ID: <20201228094025.049b87d4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Mon, 28 Dec 2020 10:25:40 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> On Mon, Dec 28 2020, Thomas Petazzoni wrote:
> > Packages having a newer version
> > ===============================
> >
> >                        libcurl |  DISTRO  | https://release-monitoring.org/project/00381 | 7.73.0       | 7.74.0       |     
> >                         strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.9          | 5.10         |     
> >                        uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.2.0        | 2.3.0        |       
> 
> Current master (commit 1a78af4d10f) have the latest version of all these
> packages. What commit is this report based on?

Thanks for reporting this! The report is based on next when a next
branch exists, otherwise on master. The thing is that after merging
next into master following the 2020.11 release, the next branch was not
removed from the official repo, which meant this report was still
generated based on the next branch, rather than next.

We need to remember to delete the next branch when it is merged into
master. Or perhaps we need to change the logic that decides what is the
"latest" code base.

In the mean time, I have dropped the next branch from the official
repo, so tomorrow's report should be updated. Let me know if it isn't
the case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
