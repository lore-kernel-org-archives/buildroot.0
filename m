From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 20:30:59 +0200
Subject: [Buildroot] [PATCH] imagemagick: Enable for host
In-Reply-To: <53A71225.3000201@bergerie>
References: <1402902112-12487-1-git-send-email-vincent.stehle@laposte.net>
 <20140622191436.7d432cbe@free-electrons.com>
 <53A71225.3000201@bergerie>
Message-ID: <20140622203059.5a5f28a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

On Sun, 22 Jun 2014 19:28:05 +0200, Vincent wrote:

> > we expect the patch adding the host package to be
> > submitted alongside the patch adding the target package needing it,
> > so that there is no "unneeded" host package.
> 
> Ah! I did not know about that rule. It makes sense, indeed.
> 
> I am trying to package ev3sources, which needs convert at build time. 
> I'll re-submit this host-imagemagick patch alongside, then.

Ok, no problem. Indeed, host-imagemagick will be perfectly fine when
submitted alongside the ev3sources package.

In the mean time, I'll mark your patch as "Changes requested" in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
