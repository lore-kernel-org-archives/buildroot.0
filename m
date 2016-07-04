From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 14:55:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160704145515.04091db5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 18:46:31 +0200, Bernd Kuhls wrote:
> Also propagate as reverse dependency to libplayer & tovid.
> 
> Fixes
> http://autobuild.buildroot.net/results/630/6306757da3be9bb7e3cdcbfc8abb4e64a3fb7913/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libplayer/Config.in | 1 +
>  package/mplayer/Config.in   | 2 ++
>  package/tovid/Config.in     | 2 ++
>  3 files changed, 5 insertions(+)

Applied with an improved commit log, using the explanations you have
provided in our discussion. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
