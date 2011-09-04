From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 4 Sep 2011 19:45:08 +0200
Subject: [Buildroot] [PATCH 04/16] package: add <pkg>-rebuild and
 <pkg>-reconfigure
In-Reply-To: <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826051.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
 <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826051.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20110904172950.GA677@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23:29 Wed 31 Aug     , Thomas Petazzoni wrote:
> We are often asked "how can I restart the build of a package ?" or
> "how can I restart the build of package from the configure part
> ?". Obviously, tweaking with stamp files is possible, but not very
> user friendly.
> 
> Therefore this patch adds two new per-package targets: <pkg>-rebuild
> and <pkg>-reconfigure. They will remove the right stamp files and
> restart the complete build process (by using the 'all' target, so that
> not only the package is reconfigured, recompiled and reinstalled, but
> the root filesystem images are also regenerated).

It will be good to have a doc of all this command and the description

Best Regards,
J.
