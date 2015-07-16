From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:11:42 +0200
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
Message-ID: <20150716231142.6486d101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ed Swierk,

On Thu, 16 Jul 2015 13:58:49 -0700, Ed Swierk wrote:
> This patch updates the polarssl package to build the current mbed 1.3.x
> release.
> 
> It also prefixes the generated binaries with mbed_, to avoid names that
> overlap with other packages (like sha1sum) or that are generic and
> confusing (like selftest or hello).
> 
> Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
> ---
>  package/polarssl/0001-no-test-suite.patch          | 27 ----------------------
>  ...he-standard-CMake-flag-to-drive-the-share.patch | 18 +++++++--------
>  package/polarssl/polarssl.hash                     |  4 ++--
>  package/polarssl/polarssl.mk                       | 17 +++++++++++---
>  4 files changed, 25 insertions(+), 41 deletions(-)
>  delete mode 100644 package/polarssl/0001-no-test-suite.patch

Thanks for your patch. However, following Gustavo's comment, I've
marked your patch as "Changes Requested" in our patch tracking system.
Can you resubmit a new version that takes into account Gustavo's
comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
