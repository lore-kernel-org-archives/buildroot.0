From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2011 08:52:16 +0200
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
 configure
In-Reply-To: <j4dc25$juq$1@dough.gmane.org>
References: <20110906191020.GA29969@berrier.lan>
 <20110906232416.077d2091@skate> <j47s9g$n6q$1@dough.gmane.org>
 <20110907161121.41b2a43b@skate> <j4dc25$juq$1@dough.gmane.org>
Message-ID: <20110912085216.5cbe6142@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wade,

Le Fri, 09 Sep 2011 09:40:51 -0600,
Wade Berrier <wberrier@gmail.com> a ?crit :

> Running this command on my older (2010.02) version of buildroot
> doesn't have an rpath.  So it looks like it was already fixed.  Sorry
> for the noise :(

The logic that makes sure that an rpath is added to host binaries has
been added in 4fdecac9d692b8d6f071ba6ad938b6ad68b675fd in July 2010.

It would be great if you could try with a newer version on RHEL5,
because I'm not sure many of us test this distribution, even though it
is a quite common one in corporate environments. So we're definitely
interested in bug reports, but of course on modern Buildroot versions.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
