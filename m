From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 16:46:02 +0200
Subject: [Buildroot] [PATCH] dbus: disable bundled initscript
In-Reply-To: <1468679532-8102-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1468679532-8102-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160716164602.5ce66faa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 11:32:12 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Otherwise it will install $(TARGET_DIR)/etc/rc.d/init.d/messagebus when
> building on a redhat/fedora host.
> Regardless of that we provide our own initscript.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/dbus/dbus.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
