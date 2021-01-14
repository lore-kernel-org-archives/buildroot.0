From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:27:47 +0100
Subject: [Buildroot] [PATCH] package/boost: bump version to 1.75.0
In-Reply-To: <20210114180753.591695-1-buildroot@heine.tech>
References: <20210114180753.591695-1-buildroot@heine.tech>
Message-ID: <20210114222747.21b637cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 19:07:52 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

>  * add option for new library Boost.JSON
>  * drop patch 0001 as it's applied upstream
>  * host: disable options that were added over time but never disabled for the host-build
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  .../{0002-fenv.patch => 0001-fenv.patch}      |  0
>  package/boost/0001-fix-uclibc-eventfd.patch   | 38 -------------------
>  package/boost/Config.in                       | 10 +++++
>  package/boost/boost.hash                      |  2 +-
>  package/boost/boost.mk                        | 10 +++--
>  5 files changed, 17 insertions(+), 43 deletions(-)
>  rename package/boost/{0002-fenv.patch => 0001-fenv.patch} (100%)
>  delete mode 100644 package/boost/0001-fix-uclibc-eventfd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
