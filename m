From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:58:39 +0200
Subject: [Buildroot] [PATCH 1/1] dieharder: fix link issue with inline
 function not declared static
In-Reply-To: <1498521231-21206-1-git-send-email-julien@vdg.name>
References: <1498521231-21206-1-git-send-email-julien@vdg.name>
Message-ID: <20170701195839.25bfc345@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 01:53:51 +0200, Julien Viard de Galbert wrote:
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  .../0004-Add-static-to-inline-functions.patch      | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/dieharder/0004-Add-static-to-inline-functions.patch

Under which conditions do the build failures happen? Do you have
references to autobuilder failures?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
