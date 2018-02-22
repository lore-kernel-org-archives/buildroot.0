From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 22 Feb 2018 09:38:42 -0500
Subject: [Buildroot] [PATCH 1/1] fs/cpio/init: preserve arguments
In-Reply-To: <20180221234332.0aab34e2@windsurf.lan>
References: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
 <20180221234332.0aab34e2@windsurf.lan>
Message-ID: <20180222143842.o47fgsp7dzjcnoiz@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 21, 2018 at 11:43:32PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 21 Feb 2018 16:02:16 -0500, Ga?l PORTAY wrote:
> > Use "$@" instead of $* to preserve argument.
> 
> Thanks for your patch, but why ? The commit log needs to explain the
> use-case/motivations/reasons.

Sorry for this lack of information.

I will send a v2 with an appropriate commit message.

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Regards,
Gael
