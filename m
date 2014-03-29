From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:23:17 +0100
Subject: [Buildroot] [PATCH] systemd: enable build for supported
 architectures.
In-Reply-To: <1396024266-6662-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1396024266-6662-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140329102317.34747d89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 28 Mar 2014 17:31:06 +0100, Eric Le Bihan wrote:
> Systemd only supports the architectures defined in
> src/shared/architecture.h. So via a new parameter named
> BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS, we enable the build of this package
> only for those architectures.
> 
> Fixes http://autobuild.buildroot.net/results/bcc/bcce95eb0748505c0d62db21a6e420aae3c3181b/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/Config.in |    9 ++++++++-
>  system/Config.in          |    2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
