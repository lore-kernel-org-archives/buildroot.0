From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:02:36 +0200
Subject: [Buildroot] [PATCH 2/2]
 package/x11r7/xdriver_xf86-input-synaptics: depends on libevdev
In-Reply-To: <1438374309-1902-2-git-send-email-bernd.kuhls@t-online.de>
References: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
 <1438374309-1902-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150806090236.708ab993@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 31 Jul 2015 22:25:09 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/05e/05ecfaf591e85a20071875ecd18068762193defa/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-input-synaptics/Config.in                    | 1 +
>  .../x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
