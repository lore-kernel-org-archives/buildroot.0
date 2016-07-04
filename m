From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:43:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Fix static linking
 with tremor & libogg
In-Reply-To: <1467480913-29319-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467480913-29319-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160704114302.7ba5a9bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 19:35:13 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/bc9/bc98fa585399b53ea181dbaf392b93424145911d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/0005-tremor-ogg.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/mplayer/0005-tremor-ogg.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
