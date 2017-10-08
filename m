From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:15:01 +0200
Subject: [Buildroot] [PATCH v4 2/3] package/freeswitch-mod-bcg729: new
 package
In-Reply-To: <20171006202829.431-2-bernd.kuhls@t-online.de>
References: <20171006202829.431-1-bernd.kuhls@t-online.de>
 <20171006202829.431-2-bernd.kuhls@t-online.de>
Message-ID: <20171008231501.793fdb96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Oct 2017 22:28:28 +0200, Bernd Kuhls wrote:
> This package is based on the bcg729 library from Belledonne Communica-
> tions which is wrapped into a freeswitch module to provide a native
> G729.A codec.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v4: added dependency to !BR2_STATIC_LIBS (Arnout), added license hash
> v3: bumped to latest version
> v2: renamed package from freeswitch_mod_bcg729 to freeswitch-mod-bcg729
>     (Thomas)

Do be honest, I am not a big fan of the compile commands inside
Buildroot's .mk file. Wouldn't it be possible to patch the package
build system and get the patches merged upstream, if there is an active
upstream of course?

That being said, since there has been prior discussion with Arnout on
this, I'll assume the pros/cons have been weighted, so I've applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
