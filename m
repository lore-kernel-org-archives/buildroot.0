From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 12:39:34 +0200
Subject: [Buildroot] [PATCH v2 1/6] pkg-infra: remove self-dependency
 from host packages
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <20120714121644.6d62142b@skate>
 <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <20120715123934.293ff850@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 22:31:19 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> When HOST_XXX_DEPENDENCIES are derived automatically from
> XXX_DEPENDENCIES, a self-dependency is created if host-xxx is a dependency
> of xxx.  This was the case for miniperl.
> 
> Filter out the self-dependency.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks, applied, as well as the 5 related cleanups in packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
