From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 14:30:06 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/swupdate: new package
In-Reply-To: <20150425102232.GB4275@free.fr>
References: <1429916563-20332-1-git-send-email-joerg.krause@embedded.rocks>
 <20150425102232.GB4275@free.fr>
Message-ID: <20150425143006.4478f374@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Apr 2015 12:22:32 +0200, Yann E. MORIN wrote:

> > +SWUPDATE_VERSION = c68f02320858f89f2d441ff2057d49489fb6f586
> > +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> > +SWUPDATE_LICENSE = GPLv2+
> 
> In fact, there are a few other licenses. For example, the copies of
> Mongoose and lsqlite3 they bundle are MIT; the sqlite3 aggregated source
> file is public domain ("The author disclaims copyright to this source
> code.").

Do we care about this? If the all thing is then linked with GPLv2 code,
then the result is GPLv2 license, no?

Indeed, the authors of the MIT licensed code should get credited (by
means of a file in <pkg>_LICENSE_FILES), but I'm not sure we need to
mention MIT and public domain in <pkg>_LICENSE.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
