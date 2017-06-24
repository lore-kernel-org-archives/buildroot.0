From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 23:28:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/dhcp: dhcp server: select
 systemd tmpfile support when systemd is used
In-Reply-To: <20170526221348.19078-2-romain.naour@gmail.com>
References: <20170526221348.19078-1-romain.naour@gmail.com>
 <20170526221348.19078-2-romain.naour@gmail.com>
Message-ID: <20170624232810.2728f3ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 00:13:48 +0200, Romain Naour wrote:
> tmpfile support is optional in systemd but the dhcp server install it's
> config file in $(TARGET_DIR)/usr/lib/tmpfiles.d directory when systemd
> is used as init system.
> 
> So it seems that dhcp server require tmpfile support for systemd based
> system.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/dhcp/Config.in | 1 +
>  1 file changed, 1 insertion(+)

I'm not a big expert in systemd stuff, but nobody else complained for
almost a month, so I've applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
