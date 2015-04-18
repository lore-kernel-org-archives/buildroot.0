From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:35:29 +0200
Subject: [Buildroot] [PATCH 1/2] libnl: add patch to fix bmon build
 breakage
In-Reply-To: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150418153529.4830ea05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 17 Apr 2015 07:26:44 -0300, Gustavo Zacarias wrote:
> Revert a 3.2.26 patch that breaks the bmon build (among possibly
> others). Fixes:
> http://autobuild.buildroot.net/results/296/296bcaf4fd1fadcab71881d6d00a8763bfa91a41/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...remove-unnecessary-include-of-private-lin.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch

Both applied, thanks.

However, for the libnl patch, can it be fixed upstream? Or should it
really be fixed in bmon?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
