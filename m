From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 00:01:17 +0200
Subject: [Buildroot] [PATCH v2 1/5] liburcu: Bump version to 0.8.7
In-Reply-To: <1442327721-24458-1-git-send-email-benjamin.h.shelton@intel.com>
References: <1442327721-24458-1-git-send-email-benjamin.h.shelton@intel.com>
Message-ID: <20150916000117.326e9cf5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ben Shelton,

On Tue, 15 Sep 2015 09:35:17 -0500, Ben Shelton wrote:
> Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
> ---
>  package/liburcu/liburcu.hash | 6 +++---
>  package/liburcu/liburcu.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied the entire patch series, thanks!

There's one thing that could have been done better though (but it can
be handled as follow-up patches): instead of propagating the
availability of liburcu on AArch64 to all its reverse dependencies, we
could have instead switched to the BR2_PACKAGE_<foo>_ARCH_SUPPORTS
model, which makes such changes a lot simpler.

See for example how BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS is defined and
used. Follow-up patches welcome, as I said :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
