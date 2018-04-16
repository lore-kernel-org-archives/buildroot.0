From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 16:38:06 +0200
Subject: [Buildroot] [PATCH] swupdate: install web application version 2
In-Reply-To: <20180416114444.26220-1-chemobejk@gmail.com>
References: <20180415195628.4CE0F88476@busybox.osuosl.org>
 <20180416114444.26220-1-chemobejk@gmail.com>
Message-ID: <20180416163806.2621dd5f@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 14:44:44 +0300, Stefan Becker wrote:
> The old web application under www/ and mongoose API v1 no longer work
> after upgrading to 2018.03. Install web application version 2 from
> examples/www/v2/ to /var/www/swupdate/ instead.
> 
> This fix does not address the fact that you can't rebuild the new web
> application under buildroot. That would require host Node.js & npm to
> run the application build. I.e. for now users have to live with the
> example application or apply patches directly to the built version of
> the appication.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Thanks for this patch. However, another patch from Julien Corjon came at
about the same time, and I've applied Julien's patch. Sorry about
that :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
