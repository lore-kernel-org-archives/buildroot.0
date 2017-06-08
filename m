From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:43:24 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <20170605073740.855-1-francois.perrad@gadz.org>
References: <20170605073740.855-1-francois.perrad@gadz.org>
Message-ID: <20170608214324.7ef3bf05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 09:37:40 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/br2-external               | 2 +-
>  support/scripts/check-bin-arch             | 2 +-
>  support/scripts/fix-configure-powerpc64.sh | 2 +-
>  support/scripts/genimage.sh                | 2 +-
>  support/scripts/hardlink-or-copy           | 2 +-
>  support/scripts/test-pkg                   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
