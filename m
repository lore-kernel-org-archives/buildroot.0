From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 May 2018 14:33:05 +0200
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <20180518143217.3c5f445a@windsurf>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <20180518143217.3c5f445a@windsurf>
Message-ID: <20180518143305.2592575b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 May 2018 14:32:17 +0200, Thomas Petazzoni wrote:

> Ah, I was looking for a solution to this rpcgen problem.
> 
> It is worth mentioning that we have a big patch in the libtirpc package
> to add the source code for rpcgen. So perhaps this should be removed,
> and libtirpc should depend on host-nfs-utils.

Forget that: I saw your patch that does *exactly* this.

I should read *all* the patches in the queue before replying to the
first ones :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
