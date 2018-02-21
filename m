From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 23:43:32 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio/init: preserve arguments
In-Reply-To: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
References: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180221234332.0aab34e2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 16:02:16 -0500, Ga?l PORTAY wrote:
> Use "$@" instead of $* to preserve argument.

Thanks for your patch, but why ? The commit log needs to explain the
use-case/motivations/reasons.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
