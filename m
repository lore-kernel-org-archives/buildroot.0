From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:19:43 +0200
Subject: [Buildroot] [PATCH] package/aircrack-ng: fix musl build
In-Reply-To: <1438192035-20476-1-git-send-email-romain.naour@openwide.fr>
References: <1438192035-20476-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150729221943.717e5a2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 29 Jul 2015 19:47:15 +0200, Romain Naour wrote:
> Backport an upstream patch [1] and remove sys/cdefs.h from
> ethernet.h as suggested by the musl wiki [2].
> 
> Fixes:
> http://autobuild.buildroot.net/results/9721496871d104b4cfb68ce133b5f48612cb7e50/
> 
> [1] https://github.com/aircrack-ng/aircrack-ng/commit/42de9f800056601443ac12edbba7bd5802740db2
> [2] http://wiki.musl-libc.org/wiki/FAQ
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...ide-ng-Use-termios-instead-of-sys-termios.patch | 27 +++++++++++
>  package/aircrack-ng/0004-fix-musl-build.patch      | 53 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
>  create mode 100644 package/aircrack-ng/0004-fix-musl-build.patch

Applied, thanks! Please don't forget to submit patch 0004 upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
