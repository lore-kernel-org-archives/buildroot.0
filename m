From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:46:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: python support depends on
 icu
In-Reply-To: <20180509172553.856-1-bernd.kuhls@t-online.de>
References: <20180509172553.856-1-bernd.kuhls@t-online.de>
Message-ID: <20180513214652.23a36fff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 19:25:53 +0200, Bernd Kuhls wrote:
> Upstream checks for icu when build with python support:
> https://github.com/znc/znc/commit/4fe4a45dd62411ba9ede04750ca44f071e7d6cbb
> 
> Fixes
> http://autobuild.buildroot.net/results/9e4/9e44159820789f1d25efcbd24318b0e05e132371/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/znc/znc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
