From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:15:41 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/freeswitch: Use mod_g729
 only when freeswitch-mod-bcg729 is disabled
In-Reply-To: <20171006202829.431-3-bernd.kuhls@t-online.de>
References: <20171006202829.431-1-bernd.kuhls@t-online.de>
 <20171006202829.431-3-bernd.kuhls@t-online.de>
Message-ID: <20171008231541.0627b232@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Oct 2017 22:28:29 +0200, Bernd Kuhls wrote:
> mod_g729 contained in freeswitch source provides pass-through:
> https://freeswitch.org/confluence/display/FREESWITCH/mod_g729
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: added comment (Arnout)
> v3: no changes
> v2: no changes

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
