From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 17:49:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/lcdproc: override
 freetype-config path
In-Reply-To: <20170611131317.16345-1-romain.naour@gmail.com>
References: <20170611131317.16345-1-romain.naour@gmail.com>
Message-ID: <20170611174955.28f5994e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 15:13:16 +0200, Romain Naour wrote:
> freetype-config from the host system may be used when installed.
> Make sure that the one from HOST_DIR is used.
> 
> checking if freetype support has been enabled... yes
> checking for freetype-config... /usr/bin/freetype-config
> checking for FreeType -- version >= 7.0.1... cross compiling; assuming OK... yes
> 
> Fixes:
> http://autobuild.buildroot.net/results/c7c/c7c52cd56b985fd73434d5997e9a6ab3f7d7e71e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/lcdproc/lcdproc.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. However, it's quite surprising to see this
change, only a week after you did commit
ce2e622dfe8a3f36bdf0c25b37a9f6ebbb23b6cc. What happened?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
