From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 07:58:40 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120312075840.648c0cba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 11 Mar 2012 22:58:49 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
> -HOST_INTLTOOL_CONF_OPT = \
> -  PERLLIB=$(HOST_DIR)/usr/lib/perl

Has this been tested on a system where libxml-parser-perl is not
installed?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
