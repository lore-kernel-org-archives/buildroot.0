From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 10:11:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <20170612041512.9374-1-bernd.kuhls@t-online.de>
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
Message-ID: <20170612101107.6bd19474@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 06:15:12 +0200, Bernd Kuhls wrote:
> README was renamed to README.md
> https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34
> 
> Fixes
> http://autobuild.buildroot.net/results/02b/02b897a843b995bf5bf3f993f48689870a551dd5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mcelog/mcelog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
