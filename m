From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2009 10:04:59 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
Message-ID: <20091106100459.2624b645@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 6 Nov 2009 08:47:16 +0100,
Joachim Pihl <jpihl@nevion.com> a ?crit :

> /usr/lib has a lot of glib*.so files that were not previously there,
> and also iconv has been added. In addition, both libstd++.so.6.0.9
> and libstd++.so.6.0.10 are added. /usr/lib is now twice the size of
> that of the previous target, meaning it won't fit on the target
> anymore. I believe glib* are parts of GLIBC, how come it is installed
> when I am trying to build a uclibc system?

As Sven said, glib is a different thing than glibc. It's a foundation
library of the Gtk stack.

> If anyone would like to help investigate the problem, I can send my  
> configuration files to you to see if you are able to recreate the  
> behaviour.

Please send your .config to the list and describe what are the
dependencies of your own applications.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
