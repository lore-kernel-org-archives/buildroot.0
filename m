From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2011 08:48:12 +0200
Subject: [Buildroot] [PATCH 04/16] package: add <pkg>-rebuild and
 <pkg>-reconfigure
In-Reply-To: <20110904172950.GA677@game.jcrosoft.org>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
 <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826051.git.thomas.petazzoni@free-electrons.com>
 <20110904172950.GA677@game.jcrosoft.org>
Message-ID: <20110905084812.33d18c00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 4 Sep 2011 19:45:08 +0200,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> > Therefore this patch adds two new per-package targets: <pkg>-rebuild
> > and <pkg>-reconfigure. They will remove the right stamp files and
> > restart the complete build process (by using the 'all' target, so
> > that not only the package is reconfigured, recompiled and
> > reinstalled, but the root filesystem images are also regenerated).
> 
> It will be good to have a doc of all this command and the description

Yes, definitely. However, I have posted a separate set of patches that
convert the documentation to the asciidoc format. I'd prefer to know if
those patches get merged before making the effort of updating the
documentation.

If those features get merged without being documented within the next
weeks, do not hesitate to remind me, this is indeed very important.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
