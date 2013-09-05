From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 09:33:15 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.23
In-Reply-To: <1378337198-29945-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378337198-29945-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130905093315.64d800a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 4 Sep 2013 18:26:38 -0500, Ryan Barnett wrote:
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  .../util-linux-001-sscanf-no-ms-as.patch           |  186 +++++++++++---------
>  .../util-linux-002-add-missing-rpmatch.patch       |   51 ------
>  ...l-linux-003-program-invocation-short-name.patch |   29 ++--
>  .../util-linux/util-linux-004-xtensa-support.patch |   16 --
>  package/util-linux/util-linux.mk                   |    2 +-
>  5 files changed, 117 insertions(+), 167 deletions(-)
>  delete mode 100644 package/util-linux/util-linux-002-add-missing-rpmatch.patch
>  delete mode 100644 package/util-linux/util-linux-004-xtensa-support.patch

Thanks for this update (and the one of linux-pam). Generally, when a
bump is not completely mechanical (i.e just bumping the version field),
I like to see a bit more explanations about what was done on the
patches (which ones were removed, for what reason, which ones were
updated, which ones were added), etc.

Same for changes in the package itself, for example in the linux-pam
package you've added a host-pkgconf dependency, it's worth mentioning
that in the commit log to help reviewers understand why that was done.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
