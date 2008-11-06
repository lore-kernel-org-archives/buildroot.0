From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2008 17:43:40 +0100
Subject: [Buildroot] bluez
In-Reply-To: <c88e466f0811060612r70f1d4f7nec4376aca9414dbe@mail.gmail.com>
References: <c88e466f0811060612r70f1d4f7nec4376aca9414dbe@mail.gmail.com>
Message-ID: <20081106174340.208dc156@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 6 Nov 2008 15:12:02 +0100,
"Michel Benoit" <michel.benoit@sepab.se> a ?crit :

> Has anyone cross compiled bluez-libs and bluez-utils with buildroot?

As far as I can see, we don't have these packages in Buildroot yet, and
there doesn't seem to be anything related to bluez in the bug tracker
(but the search engine looks a bit weird, no sure it works properly).

Back in 2005, some people tried to compile bluez with Buildroot, see
http://osdir.com/ml/bluez.devel/2005-03/msg00089.html.

Anyway, adding support for bluez-libs and bluez-utils to buildroot
should be relatively simple, since they use the classical autotools. A
few lines of .mk and Config.in should do the basic things.

Do you want to provide a patch for these ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
