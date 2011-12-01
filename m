From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Dec 2011 14:52:24 +0100
Subject: [Buildroot] [git commit] dropbear: bump to version 2011.54
In-Reply-To: <201112010722.35449.minimod@morethan.org>
References: <20111201085828.CEE7D8F626@busybox.osuosl.org>
 <201112010722.35449.minimod@morethan.org>
Message-ID: <20111201145224.197356c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 1 Dec 2011 07:22:33 -0600,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> Has the "DROPBEAR_SOURCE" line been accidentally dropped here?
> At "DROPBEAR_SITE" the package is named: dropbear-2011.54.tar.gz
> (or .tar.bz2)

This <pkg>_SOURCE value is the default one:

$(2)_BASE_NAME  =  $(1)-$$($(2)_VERSION)
$(2)_SOURCE     ?= $$($(2)_BASE_NAME).tar.gz

(from package/Makefile.package.in)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
