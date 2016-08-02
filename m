From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:42:46 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.4.1
In-Reply-To: <1470150826-1175-1-git-send-email-romain.naour@gmail.com>
References: <1470150826-1175-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160802214246.6b66b0fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 17:13:46 +0200, Romain Naour wrote:
> Remove upstream patches.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-veth-avoid-kernel-header-issue-with-musl.patch | 90 ----------------------
>  ...-Disable-Werror-date-time-for-kernel-3.14.patch | 35 ---------
>  ...6-PCIe-Fix-name-of-sched_priority-element.patch | 52 -------------
>  ...apps-include-stdarg.h-in-eventlogstring.h.patch | 61 ---------------
>  package/openpowerlink/openpowerlink.hash           |  8 +-
>  package/openpowerlink/openpowerlink.mk             |  2 +-
>  6 files changed, 5 insertions(+), 243 deletions(-)
>  delete mode 100644 package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
>  delete mode 100644 package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
>  delete mode 100644 package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
>  delete mode 100644 package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
