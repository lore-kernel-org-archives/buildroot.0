From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:18:05 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.17
In-Reply-To: <1413632093-16706-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413632093-16706-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141018191805.3802502d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 18 Oct 2014 08:34:53 -0300, Gustavo Zacarias wrote:
> Patch now silently upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...001-add-option-to-disable-backtrace-usage.patch | 88 ----------------------
>  package/btrfs-progs/btrfs-progs.hash               |  2 +-
>  package/btrfs-progs/btrfs-progs.mk                 |  2 +-
>  3 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch

Applied, thanks. And thanks to Maxime for the testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
