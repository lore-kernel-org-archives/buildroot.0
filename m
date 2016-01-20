From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:26:34 +0100
Subject: [Buildroot] [PATCH] gcc: immediate changes to arc-2015.12-rc1.
In-Reply-To: <1453315351-21372-1-git-send-email-ltrimas@synopsys.com>
References: <1453315351-21372-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160120212634.7dfe3caa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Wed, 20 Jan 2016 21:42:31 +0300, Lada Trimasova wrote:
> These patches solve several problems that were discovered
> after bumping tools to arc-2015.12-rc1.
> 
> The fixes were done in development tree arc-4.8-dev and will be
> a part of the next release of ARC GNU tools.
> Once that new release happens these patches must be removed.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 +++++++++++++++++++++
>  ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 +++++++++++++++++
>  ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 ++++++++++++++++++++
>  3 files changed, 286 insertions(+)
>  create mode 100644 package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
>  create mode 100644 package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
>  create mode 100644 package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
