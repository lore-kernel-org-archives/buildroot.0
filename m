From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2009 09:10:27 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <87eivtx0c4.fsf@macbook.be.48ers.dk>
References: <20090414103327.2fd69516@danhplaptop>
	<87eivtx0c4.fsf@macbook.be.48ers.dk>
Message-ID: <20090416091027.6c6153fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Apr 2009 20:01:47 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Dan> And what's the "make" argument for Buildroot that should clean
>  Dan> everything, but not destroy my configs? "make clean" destroys
>  Dan> configs, or at least did last time I typed it...
> 
> make distclean.

Which is quite confusing since :

$ make help | grep distclean
  distclean              - delete all non-source files (including .config)

 :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
