From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:57:13 +0200
Subject: [Buildroot] [PATCH 1/2] libnetfilter_acct: bump to version 1.0.3
In-Reply-To: <1471958374-16839-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471958374-16839-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160823175713.2e3409c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 10:19:33 -0300, Gustavo Zacarias wrote:
> Drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnetfilter_acct/0001-uclinux.patch     | 26 ------------------------
>  package/libnetfilter_acct/libnetfilter_acct.hash |  6 +++---
>  package/libnetfilter_acct/libnetfilter_acct.mk   |  2 +-
>  3 files changed, 4 insertions(+), 30 deletions(-)
>  delete mode 100644 package/libnetfilter_acct/0001-uclinux.patch

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
