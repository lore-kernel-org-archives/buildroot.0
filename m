From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 14:38:54 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.22.1
In-Reply-To: <20190815085055.21868-1-judge.packham@gmail.com>
References: <20190815085055.21868-1-judge.packham@gmail.com>
Message-ID: <20190815143854.57470c80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 20:50:55 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Import new version an drop two patches that have been applied upstream.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  .../0002-build-make-dlsym-optional.patch      | 160 ------------------
>  ...thread-atfork-also-in-libc-nonshared.patch |  49 ------
>  package/syslog-ng/syslog-ng.hash              |   2 +-
>  package/syslog-ng/syslog-ng.mk                |   2 +-
>  4 files changed, 2 insertions(+), 211 deletions(-)
>  delete mode 100644 package/syslog-ng/0002-build-make-dlsym-optional.patch
>  delete mode 100644 package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
