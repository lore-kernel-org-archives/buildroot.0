From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:33:20 +0200
Subject: [Buildroot] [PATCH 1/2 v3] odroid-scripts: New Package.
In-Reply-To: <trinity-ae8b0b55-8d97-4c34-9726-f0a50212c8e1-1469366784462@3capp-mailcom-bs05>
References: <20160724055602.7159-1-daggs@gmx.com>
 <20160724144040.52d51f5f@free-electrons.com>
 <trinity-ae8b0b55-8d97-4c34-9726-f0a50212c8e1-1469366784462@3capp-mailcom-bs05>
Message-ID: <20160724153320.1329f844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 15:26:24 +0200, daggs wrote:

> > The changelog should not be part of the commit log.
> >   
> > > 
> > > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > > ---  
> > 
> > It should be here.  
> 
> I always seems to forget were to place it.... :-/

It's pretty simple:

"""
foo: new package

Blabla what this new package is all about. Blabla.

Signed-off-by: John Doe
---
Changes since v2:
 ...
"""

Everything that is *above* the "---" sign gets kept in the Git history
as the commit log. Everything that is *below" the "---" sign is ignored
when the patch is applied.

Since the changelog is describing what was changed between iterations
of the patch, we don't want the changelog to be committed forever in
the Git history, so it should be below the "---" sign.

When doing a commit, you can simply introduce a "---" manually below
your Signed-off-by and write your changelog here.


> this resulted im my serial usb stop working, e.g. I didn't know where I was in the boot nor couldn't log in into the system.
> 
> without both of the changes, the system boots ok.

OK, makes sense. Thanks for explaining.

> > Other than that, looks good. Can you respin a new version?  
> 
> maybe later today.

Sure, or another day, there's no hurry.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
