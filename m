From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:05:01 +0100
Subject: [Buildroot] [PATCH] busybox: bump to version 1.23.2
In-Reply-To: <1427296681-7053-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427296681-7053-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150325200501.68180ec9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 25 Mar 2015 12:18:01 -0300, Gustavo Zacarias wrote:
> Drop upstream patches.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/0002-modprobe-small.patch | 171 ---------------------------
>  package/busybox/0003-dc.patch             | 163 --------------------------
>  package/busybox/0004-wget.patch           | 185 ------------------------------
>  package/busybox/0005-modinfo.patch        |  17 ---
>  package/busybox/busybox.hash              |   6 +-
>  package/busybox/busybox.mk                |   2 +-
>  6 files changed, 4 insertions(+), 540 deletions(-)
>  delete mode 100644 package/busybox/0002-modprobe-small.patch
>  delete mode 100644 package/busybox/0003-dc.patch
>  delete mode 100644 package/busybox/0004-wget.patch
>  delete mode 100644 package/busybox/0005-modinfo.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
