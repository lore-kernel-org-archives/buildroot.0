From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 23:37:13 +0200
Subject: [Buildroot] [PATCH] tcl: replace option to install library only
 with positive option to install tclsh
In-Reply-To: <1329263337-14994-1-git-send-email-arnout@mind.be>
References: <201202150046.57364.arnout@mind.be>
 <1329263337-14994-1-git-send-email-arnout@mind.be>
Message-ID: <20120715233713.609720f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Feb 2012 00:48:57 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Without this patch, it was impossible for a package that relies on
> the tclsh interpreter to select it.  This patch replaces the
> negative BR2_PACKAGE_TCL_SHLIB_ONLY config with the positive
> BR2_PACKAGE_TCL_TCLSH config.
> 
> Also a few minor fixes to the mk-file:
> 
> - Stripping the library didn't work because it was installed read-only.
> 
> - Create a symlink tclsh -> tclsh8.4.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Is this still needed?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
