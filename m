From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2011 11:06:43 +0200
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.7 take 2
In-Reply-To: <4E4DEB3A.3030402@ethertek.ca>
References: <4E4DA5E3.9060707@ethertek.ca>
	<4E4DEB3A.3030402@ethertek.ca>
Message-ID: <20110819110643.600032d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 18 Aug 2011 21:48:58 -0700,
Dan Pattison <dan.pattison@ethertek.ca> a ?crit :

> I forgot to include the lines below to the previous patch. Shazbot!
> 
> -LIBCONFUSE_CONF_OPT:=--disable-rpath
> +LIBCONFUSE_CONF_OPT = --enable-shared --disable-rpath

--enable-shared is not needed, it is already passed by the AUTOTARGETS
infrastructure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
