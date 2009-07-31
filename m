From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 08:46:30 +0200
Subject: [Buildroot] x86_64 error
In-Reply-To: <4A7263FB.6050006@renta.net>
References: <4A7263FB.6050006@renta.net>
Message-ID: <20090731084630.4e57ceec@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Jul 2009 13:24:43 +1000,
Mark Constable <markc@renta.net> a ?crit :

> make: *** Waiting for unfinished jobs....

I'm not exactly sure, but that would suggest that you ran make with a
-j option. If it's the case, don't, it's not supported by Buildroot.

However, in the configuration options, you can tell Buildroot to use
make -jX internally to compile the individual packages.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
