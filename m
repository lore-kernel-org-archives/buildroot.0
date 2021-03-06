From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:28:46 +0100
Subject: [Buildroot] [PATCH 1/4] package/lttng-tools: bump version to
 2.12.3
In-Reply-To: <20210224103154.174602-1-nolange79@gmail.com>
References: <20210224103154.174602-1-nolange79@gmail.com>
Message-ID: <20210306232846.0872edfe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Feb 2021 11:31:50 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> Remove patch 001 as it has been fixed upstream.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...nts-ns-tp.h-Fix-build-with-musl-libc.patch | 46 -------------------
>  package/lttng-tools/lttng-tools.hash          |  4 +-
>  package/lttng-tools/lttng-tools.mk            |  2 +-
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
