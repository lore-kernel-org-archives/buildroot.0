From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:21:00 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Version bump to 2.27.1
In-Reply-To: <20200507034630.29267-1-judge.packham@gmail.com>
References: <20200507034630.29267-1-judge.packham@gmail.com>
Message-ID: <20200507232100.29231c46@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 15:46:30 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Update to 2.27.1 and drop patch applied upstream.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  .../0002-configure.ac-fix-with-netsnmp.patch  | 49 -------------------
>  package/syslog-ng/syslog-ng.conf              |  2 +-
>  package/syslog-ng/syslog-ng.hash              |  2 +-
>  package/syslog-ng/syslog-ng.mk                |  2 +-
>  4 files changed, 3 insertions(+), 52 deletions(-)
>  delete mode 100644 package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
