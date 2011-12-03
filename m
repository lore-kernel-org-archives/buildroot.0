From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2011 19:48:47 +0100
Subject: [Buildroot] [PATCH v4 1/5] libnl: bump to version 3.2.3
In-Reply-To: <1322931812-10734-1-git-send-email-zonque@gmail.com>
References: <1322931812-10734-1-git-send-email-zonque@gmail.com>
Message-ID: <20111203194847.4ece94f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

Le Sat,  3 Dec 2011 18:03:28 +0100,
Daniel Mack <zonque@gmail.com> a ?crit :

> This newer version splits the library code into libnl, libnl-route,
> libnl-genl and libnl-nf, each individually selectable via pkgconfig.

Thanks for those updates. I have a couple of comments/questions:

 * It would be nice if you could send each version of the patch set
   with a cover e-mail (a 0/5 e-mail) that contains a changelog between
   the different versions of your patchset (i.e, what changed from v2
   to v3, from v3 to v4)

 * Many of your patches are introducing patches for various components.
   Have you submitted those to the respective upstream projects ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
