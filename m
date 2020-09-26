From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:26:44 +0200
Subject: [Buildroot] [PATCH] package/python-texttable: bump version to
 1.6.3
In-Reply-To: <20200925083523.8844-1-peter@korsgaard.com>
References: <20200925083523.8844-1-peter@korsgaard.com>
Message-ID: <20200926152644.12ccb6c1@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 10:35:23 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Bugfix release, fixing an issue with integer/float handling:
> https://github.com/foutaise/texttable/issues/70
> 
> Adjust the .hash spacing and update the license hash for a copyright year
> change:
> https://github.com/foutaise/texttable/commit/13ff0b57d3f727a266ce45f86642f0458257bb8e
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-texttable/python-texttable.hash | 6 +++---
>  package/python-texttable/python-texttable.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
