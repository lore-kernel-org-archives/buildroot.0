From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Jul 2018 22:54:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: needs threads
In-Reply-To: <20180721091338.17737-1-bernd.kuhls@t-online.de>
References: <20180721091338.17737-1-bernd.kuhls@t-online.de>
Message-ID: <20180721225441.264245db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jul 2018 11:13:38 +0200, Bernd Kuhls wrote:
> Due to the removal of the non-smp option threads are needed now:
> https://github.com/erlang/otp/commit/ee297c32a768ec333e2a8a3ef829a7690e91d306#diff-900a5d0495caac38a1f51a2cae1b2594R974
> 
> Fixes
> http://autobuild.buildroot.net/results/285/285ef07d8e0614dd90a1e4dd3ee28b116990dc0f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/erlang/Config.in | 5 +++--
>  package/erlang/erlang.mk | 7 +------
>  2 files changed, 4 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
