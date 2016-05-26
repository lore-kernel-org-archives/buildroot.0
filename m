From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:20:28 +0200
Subject: [Buildroot] [PATCH] toolchain: arc-2016.03: fix generation of
 dynamic relocs for -pie
In-Reply-To: <1464177700-23646-1-git-send-email-abrodkin@synopsys.com>
References: <1464177700-23646-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160526212028.413005ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 15:01:40 +0300, Alexey Brodkin wrote:
> Currently even if -pie flag is provided to LD dynamic relocations
> won't be created. That in its turn will break U-Boot self-relocation
> functionality.
> 
> This fix resolves mentioned problem.
> 
> Note as of today this is a sort of off-the-tree patch right from
> our binutils guy but in coming day similar fix will be applied to
> upstream binutils as well.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ith-dynamic-relocs-not-being-generated-wi.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
