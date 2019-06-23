From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:10:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: add a unprivileged user
In-Reply-To: <20190318110547.177223b9@windsurf>
References: <20190205105630.17008-1-adrien@gallouet.fr>
 <20190317174946.28ee07a5@windsurf>
 <CAFtSRGCunAxWP2VizuD_yY8zzqnOqksuzKz-F=PiFHv+JdOb7A@mail.gmail.com>
 <20190318110547.177223b9@windsurf>
Message-ID: <20190623181055.518d5d0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 11:05:47 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > If your prefer to wait, I'll resubmit a patch with the start-stop-daemon
> > script later.  
> 
> Yes, indeed, I think it makes more sense to have the new user created
> together with an init script that actually uses it.

Unless I missed it, we didn't receive a new patch that adds the init
script for bird. I'm now going to mark the "package/bird: add a
unprivileged user" patch as "Changes Requested" in patchwork. So if you
don't resubmit a new patch, we will forget about this topic.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
