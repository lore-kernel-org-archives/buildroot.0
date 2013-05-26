From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 21:44:45 +0200
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print
 capabilities
In-Reply-To: <20130526194014.GC3380@free.fr>
References: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <20120719220825.584bfb03@skate> <20130526194014.GC3380@free.fr>
Message-ID: <20130526214445.03abd9d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 May 2013 21:40:14 +0200, Yann E. MORIN wrote:

> > Hum, is this really useful? What are the use cases? What do other
> > thinks about this?
> 
> I like the overall idea, but only for printing all variables.
> It's then possible to grep the result to find the one variable one is
> interested in.
> 
> I've taken that patch in my tree (dropped the per-variable print, and
> adapted the printvars a bit), and will send a pull request to Peter
> later tonight.

I would suggest to not send patches touching the core infrastructure as
part of a pull request that also has many usually uncontroversial
package changes/updates.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
