From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 12:07:42 +0200
Subject: [Buildroot] [PATCH] package/sqlite: fix parallel build failures
In-Reply-To: <1432159112-28325-1-git-send-email-yann.morin.1998@free.fr>
References: <1432159112-28325-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150521120742.0b0d7fdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 20 May 2015 23:58:32 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/aed/aed3690689b60844e3278626da3c3eb75f2a2586/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sqlite/0001-fix-parallel-build.patch | 22 ++++++++++++++++++++++
>  package/sqlite/sqlite.mk                     |  3 +++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/sqlite/0001-fix-parallel-build.patch

Applied, thanks. I guess you've submitted this patch upstream, right?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
