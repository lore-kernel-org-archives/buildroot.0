From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:33:07 +0200
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.9.1
In-Reply-To: <1436972284-30405-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436972284-30405-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150718113307.6b64af06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 15 Jul 2015 11:58:04 -0300, Gustavo Zacarias wrote:
> Patch upstream so drop it.
> Also use main dhcpcd.c file as license info (it's in the header).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...0001-fix-in6_pktinfo-build-issue-on-linux.patch | 162 ---------------------
>  package/dhcpcd/dhcpcd.hash                         |   2 +-
>  package/dhcpcd/dhcpcd.mk                           |   5 +-
>  3 files changed, 4 insertions(+), 165 deletions(-)
>  delete mode 100644 package/dhcpcd/0001-fix-in6_pktinfo-build-issue-on-linux.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
