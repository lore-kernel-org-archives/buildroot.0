From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Dec 2012 23:48:42 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <201212052248.46769.yann.morin.1998@free.fr>
References: <1354741542-6079-1-git-send-email-zinosat@tiscali.it>
 <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
 <201212052248.46769.yann.morin.1998@free.fr>
Message-ID: <20121205234842.38b645f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 5 Dec 2012 22:48:46 +0100, Yann E. MORIN wrote:

> > +define TCLLIB_INSTALL_TARGET_CMDS
> > +	(cd $(@D); \
> > +	    tclsh installer.tcl \
> 
> Since you're using tclsh, you may also need to depend on host-tcl.

And therefore use $(HOST_DIR)/usr/bin/tclsh.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
