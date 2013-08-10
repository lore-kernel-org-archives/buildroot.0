From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 23:43:53 +0200
Subject: [Buildroot] [PATCH] kobs-ng: new package
In-Reply-To: <20130804025016.D35CB5C0DE@zaphod.pbhware.com>
References: <20130804025016.D35CB5C0DE@zaphod.pbhware.com>
Message-ID: <20130810234353.51079c70@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul B. Henson,

On Sun, 28 Jul 2013 20:14:14 -0700, Paul B. Henson wrote:
> Signed-off-by: Paul B. Henson <henson@acm.org>
> ---
>  package/Config.in                             |    1 +
>  package/kobs-ng/Config.in                     |    7 +++
>  package/kobs-ng/kobs-ng-fix-mtd-defines.patch |   73 +++++++++++++++++++++++++
>  package/kobs-ng/kobs-ng.mk                    |   13 +++++
>  4 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 package/kobs-ng/Config.in
>  create mode 100644 package/kobs-ng/kobs-ng-fix-mtd-defines.patch
>  create mode 100644 package/kobs-ng/kobs-ng.mk

Committed to next, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
