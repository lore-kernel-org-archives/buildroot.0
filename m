From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 19:03:20 +0200
Subject: [Buildroot] [PATCH v5] lighttpd: use standard web root directory
In-Reply-To: <1342789155-7320-1-git-send-email-spdawson@gmail.com>
References: <1342789155-7320-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120720190320.13a96f77@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 13:59:15 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> Acked-By: Maxime Ripard <maxime.ripard@free-electrons.com>

It still tries to use /var/www/htdocs after applying this patch:

# lighttpd -f /etc/lighttpd/lighttpd.conf 
2012-07-20 16:58:55: (configfile.c.1248) base-docroot doesn't exist: /var/www/htdocs 
2012-07-20 16:58:55: (server.c.646) setting default values failed 

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
