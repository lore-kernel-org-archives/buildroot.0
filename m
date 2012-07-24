From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 08:41:22 +0200
Subject: [Buildroot] Midori 0.4.6 impossible to build
In-Reply-To: <juki5i$u43$1@dough.gmane.org>
References: <ju27gi$sdh$1@dough.gmane.org>
	<juki5i$u43$1@dough.gmane.org>
Message-ID: <20120724084122.6d166be7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Jul 2012 00:10:59 +0200,
Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com> a ?crit :

> Just to report that issue described can be avoided when using older
> vala version. When I move to version 0.14.2 the problem disappears.
> Currently this solution is fine with me so I will not continue
> investigation why 0.15.2 is not functional for building midori.

Ok. There are more recent versions of Vala available (0.17.3 at the
time of this writing), and the Git tree of Midori has evolved a bit
since the release of 0.4.6. It would be worth checking with more recent
versions, and if it still doesn't work, report to the Midori developers.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
