From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 16:36:13 +0100
Subject: [Buildroot] [PATCH] strace: bump to version 4.11
In-Reply-To: <1450782745-28601-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450782745-28601-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151222163613.219715cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Dec 2015 08:12:25 -0300, Gustavo Zacarias wrote:
> Patch upstream so remove it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-linux-aarch64-add-missing-header.patch    | 25 ----------------------
>  package/strace/strace.hash                         |  6 +++---
>  package/strace/strace.mk                           |  2 +-
>  3 files changed, 4 insertions(+), 29 deletions(-)
>  delete mode 100644 package/strace/0001-linux-aarch64-add-missing-header.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
