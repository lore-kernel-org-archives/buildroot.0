From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:23:50 +0200
Subject: [Buildroot] [PATCH] package: Introduce
 $(2)_INFRA_EXTRA_DEPENDENCIES
In-Reply-To: <1436898465-11711-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436898465-11711-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150730232350.028b27ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 14 Jul 2015 20:27:45 +0200, Maxime Hadjinlian wrote:
> Instead of repeating the filter-out function to remove the host-package
> that we don't want as dependencies in each infra, handle it it
> pkg-generic through a generic variable, which is specified by each
> infra.
> 
> The $(2)_INFRA_EXTRA_DEPENDENCIES contains the specific host package
> that we want to filter from the package's dependencies.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-autotools.mk | 12 ++++--------
>  package/pkg-cmake.mk     |  7 -------
>  package/pkg-generic.mk   |  3 ++-
>  package/pkg-python.mk    | 17 +++--------------
>  package/pkg-rebar.mk     | 16 +++++++---------
>  package/pkg-virtual.mk   |  7 -------
>  6 files changed, 16 insertions(+), 46 deletions(-)

This patch has received some comments. Could you please handle them,
and resubmit an updated version?

In the mean time, patch marked as Changes Requested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
