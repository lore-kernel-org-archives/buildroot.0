From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:36:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix build with gcc
 10
In-Reply-To: <20200926081001.3995795-1-fontaine.fabrice@gmail.com>
References: <20200926081001.3995795-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926153629.7df8d1f2@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 10:10:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/811b9eada9558bafde4e4ed824b36239c72e0501
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ezahn-remove-unused-MZ_SIZE_LONG_INT.patch |  41 ++++
>  ...e-needlessly-global-variables-static.patch | 139 +++++++++++++
>  ...-variable-definitions-cli-h-to-cli-c.patch |  77 ++++++++
>  ...le-definitions-from-mops-h-to-mops-c.patch |  69 +++++++
>  ...-definitions-from-llist-h-to-llist-c.patch |  47 +++++
>  ...definitions-from-mz-h-to-mausezahn-c.patch | 184 ++++++++++++++++++
>  6 files changed, 557 insertions(+)
>  create mode 100644 package/netsniff-ng/0001-mausezahn-remove-unused-MZ_SIZE_LONG_INT.patch
>  create mode 100644 package/netsniff-ng/0002-mausezahn-make-needlessly-global-variables-static.patch
>  create mode 100644 package/netsniff-ng/0003-mausezahn-move-variable-definitions-cli-h-to-cli-c.patch
>  create mode 100644 package/netsniff-ng/0004-mausezahn-move-variable-definitions-from-mops-h-to-mops-c.patch
>  create mode 100644 package/netsniff-ng/0005-mausezahn-move-variable-definitions-from-llist-h-to-llist-c.patch
>  create mode 100644 package/netsniff-ng/0006-mausezahn-move-variable-definitions-from-mz-h-to-mausezahn-c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
