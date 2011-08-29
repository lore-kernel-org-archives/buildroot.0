From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2011 14:23:44 +0200
Subject: [Buildroot] [PATCH] git fetcher: do not remove the tree after
 initial clone
In-Reply-To: <4E5B445F.5050603@lucaceresoli.net>
References: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
 <4E5B445F.5050603@lucaceresoli.net>
Message-ID: <20110829142344.2edcfd12@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 29 Aug 2011 09:48:47 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> Using BR for development has not been completely neglected anyway.
> Recently, Thomas Petazzoni submitted a patch that would allow to use a
> local directory to build the package. This is much different from using
> git fetches, but is expected to serve the "use BR for development" use
> case effectively.
> You might want to test it and comment to the author. Here it is:
> http://lists.busybox.net/pipermail/buildroot/2011-July/044479.html

I still think that this local directory mechanism is a better solution.

I have a new version of my patch set, which I hope to submit soon, at
least when the 2011.11 development process will open (by the end of the
month, so should be in the next few days).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
