From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:43:31 +0200
Subject: [Buildroot] [PATCH] package/python-semver: bump version to
 2.10.2
In-Reply-To: <20200925100341.13094-1-peter@korsgaard.com>
References: <20200925100341.13094-1-peter@korsgaard.com>
Message-ID: <20200926154331.550e7bfb@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 12:03:40 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Bugfix release, fixing an issue with version fields containing '0'.  For
> details, see the changelog:
> 
> https://python-semver.readthedocs.io/en/2.10.2/changelog.html#version-2-10-2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-semver/python-semver.hash | 4 ++--
>  package/python-semver/python-semver.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
