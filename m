From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:20:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs host-yasm for
 mmx support
In-Reply-To: <1446999752-11055-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446999752-11055-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151111152015.7ec1904a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  8 Nov 2015 17:22:32 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/6a8/6a8c3a70e33cb5b3fc40d036fb0716d915185f33/
> http://autobuild.buildroot.net/results/cef/cef30d4e14d39ab64bb27a6514a0390755f4a9d2/
> http://autobuild.buildroot.net/results/03b/03b1b42688b07789971a99337708b4dbe4278665/
> http://autobuild.buildroot.net/results/5e3/5e3320dfc6793a9ff0494161cdc9a3be795462c4/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
