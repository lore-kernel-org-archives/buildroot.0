From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:38:26 +0200
Subject: [Buildroot] [PATCH] lighttpd: security bump version to 1.4.41
In-Reply-To: <1470040043-10623-1-git-send-email-peter@korsgaard.com>
References: <1470040043-10623-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160801223826.71c7957d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 10:27:23 +0200, Peter Korsgaard wrote:
> Security fixes and fixes for bugs introduced in 1.4.40.
> 
> Drop 0002-autobuild-clock_gettime-lrt-with-glibc-2.17.patch, which is now
> upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...tobuild-clock_gettime-lrt-with-glibc-2.17.patch | 155 ---------------------
>  package/lighttpd/lighttpd.hash                     |   2 +-
>  package/lighttpd/lighttpd.mk                       |   2 +-
>  3 files changed, 2 insertions(+), 157 deletions(-)
>  delete mode 100644 package/lighttpd/0002-autobuild-clock_gettime-lrt-with-glibc-2.17.patch

I've applied, after removing AUTORECONF = YES, which was no longer
needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
