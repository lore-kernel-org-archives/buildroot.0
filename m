From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 10:03:44 +0200
Subject: [Buildroot] [PATCH] Add /var/www to device table
In-Reply-To: <jsrmck$gt1$1@dough.gmane.org>
References: <1340654541-10427-1-git-send-email-spdawson@gmail.com>
 <jsrmck$gt1$1@dough.gmane.org>
Message-ID: <20120703100344.0ddac270@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 2 Jul 2012 08:33:24 +0000 (UTC),
Romain Izard <romain.izard.pro@gmail.com> a ?crit :

> Shouldn't it be changed by using a LIGHTTPD_PERMISSIONS variable,
> instead of modifying the common device table ? This makes the
> relationship more evident.

I think the point was that /var/www would not only be used by lighttpd,
but also by other web servers, and packages installing Javascript
stuff, etc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
