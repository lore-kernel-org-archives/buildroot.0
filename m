From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:38:52 +0200
Subject: [Buildroot] [PATCH 02/32] package/x11r7/xcb-util-cursor: new
 package
In-Reply-To: <1429360844-12625-2-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
 <1429360844-12625-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150418183852.49035fcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Apr 2015 14:40:14 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/Config.in                            |    1 +
>  package/x11r7/xcb-util-cursor/Config.in            |   17 +++++++++++++++++
>  package/x11r7/xcb-util-cursor/xcb-util-cursor.hash |    2 ++
>  package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   |   15 +++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/x11r7/xcb-util-cursor/Config.in
>  create mode 100644 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
>  create mode 100644 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk

I've applied patches 2 to 32, except patch 28, since I asked a question
about it.

On the new package additions, I had to rewrap the Config.in help text
almost each time, but other than that, it looked good.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
