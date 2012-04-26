From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Apr 2012 16:45:11 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <20120426140840.GJ20601@game.jcrosoft.org>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
 <20120426140840.GJ20601@game.jcrosoft.org>
Message-ID: <20120426164511.2f6e462d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Apr 2012 16:08:40 +0200,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> > +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> >  source "package/lsof/Config.in"
> put a depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> in lsof/Config.in

No, that's not what we do for all other packages. Gustavo's patch is
correct with regard to the current guidelines.

Now, whether we should change those guidelines to something else is a
different story. But if we change the guideline, it should be changed
for all packages and not just for lsof.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
