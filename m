From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 12:18:57 +0200
Subject: [Buildroot] [PATCH] busybox: bump to version 1.25.1
In-Reply-To: <1476119643-21935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476119643-21935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161011121857.078d1241@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 14:14:03 -0300, Gustavo Zacarias wrote:
> Drop upstream patches.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/0003-gzip.patch                      | 18 ------------------
>  ...top-move-free-prev_hist-out-of-signal-path.patch} |  0
>  package/busybox/0004-ip.patch                        | 18 ------------------
>  package/busybox/0005-ntpd.patch                      | 20 --------------------
>  package/busybox/busybox.hash                         |  6 +++---
>  package/busybox/busybox.mk                           |  2 +-
>  6 files changed, 4 insertions(+), 60 deletions(-)
>  delete mode 100644 package/busybox/0003-gzip.patch
>  rename package/busybox/{0006-top-move-free-prev_hist-out-of-signal-path.patch => 0003-top-move-free-prev_hist-out-of-signal-path.patch} (100%)
>  delete mode 100644 package/busybox/0004-ip.patch
>  delete mode 100644 package/busybox/0005-ntpd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
