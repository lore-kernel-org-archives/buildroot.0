From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2015 10:17:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/libmicrohttpd: mark as broken
 on Nios II, infamous _gp issue
In-Reply-To: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150801101703.78d142a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 31 Jul 2015 22:25:08 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/76f/76f838b2b33311897f3c2ce82a65f3b73af2c046/
> 
> Propagate reverse dependency to janus-gateway. I did not propagate the
> reverse dependency to kodi, ola and systemd because they are not
> available for nios.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/janus-gateway/Config.in | 4 ++++
>  package/libmicrohttpd/Config.in | 5 +++++
>  2 files changed, 9 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
