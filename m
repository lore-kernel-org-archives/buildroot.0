From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:21:45 +0200
Subject: [Buildroot] [PATCH v3 1/1] python-websockets: backport fix for
 upstream issue #350
In-Reply-To: <20180510221712.13031-1-joseph.kogut@gmail.com>
References: <20180507221823.6364-1-joseph.kogut@gmail.com>
 <20180510221712.13031-1-joseph.kogut@gmail.com>
Message-ID: <20180511232145.52c7f2de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On Thu, 10 May 2018 15:17:12 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> 
> Changes v2 -> v3:
> 	- Fix missing Signed-off-by for included patch (suggested by
> 	  Baruch)
> 	- Fix patch naming (suggested by Baruch) 
> 
> Changes v1 -> v2:
> 	- Include patch locally (suggested by Thomas)

The changelog is good, but it should be...

> ---

... below this sign.

Otherwise the changelog is preserved in the commit description when
applying the patch, which is not what we want.

I've fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
