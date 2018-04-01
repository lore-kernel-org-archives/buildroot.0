From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:23:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apache: fix lua detection
In-Reply-To: <20180401122640.1330-1-bernd.kuhls@t-online.de>
References: <20180401122640.1330-1-bernd.kuhls@t-online.de>
Message-ID: <20180401162306.3585772a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 14:26:40 +0200, Bernd Kuhls wrote:
> Patch suggested by Thomas: Adding a path to --with-lua disables
> pkgconf-based detection of lua, which in some cases needs libdl.
> 
> This patch removes --with-lua which fixes
> http://autobuild.buildroot.net/results/cc1/cc13f4cef9cf6f18615d58f1d83b233812f19fa0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rely on pkgconf (Thomas)

Ah, see how this solution is much simpler and logical? Thanks for
checking that it was indeed working. Applied!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
