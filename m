From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:27:18 +0100
Subject: [Buildroot] [PATCH 0/3] Config.in{,host}: check-package pass
In-Reply-To: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
References: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180214212718.6b2f46cd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 00:04:55 -0500, Ga?l PORTAY wrote:

> Ga?l PORTAY (3):
>   package/*/Config.in.host: fix help text check-package warnings
>   gconf: Config.in: fix help text wrapping
>   pure-ftpd: Config.in: fix help text wrapping

I've applied the patches to the master branch, thanks. However, I'd
like to finally find a solution to validate all those Config.in files
from our .gitlab-ci.yml.

The blocking problem is that package/Config.in and
package/x11r7/Config.in generate a lot of warnings, but we in fact want
to keep them as-is. See the thread at
http://patchwork.ozlabs.org/patch/849882/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
