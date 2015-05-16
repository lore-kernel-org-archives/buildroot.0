From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:36:06 +0200
Subject: [Buildroot] [PATCH 4/6] postgresql: mark as not available for
	static linking
In-Reply-To: <20150516153216.1eab6cf4@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 16 May 2015 15:32:16 +0200")
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431714233-24324-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mw14br9l.fsf@dell.be.48ers.dk>
 <20150516153216.1eab6cf4@free-electrons.com>
Message-ID: <87wq08abll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> What about the reverse dependencies?
 >> 
 >> git grep 'select BR2_PACKAGE_POSTGRESQL'
 >> package/bandwidthd/Config.in:   select BR2_PACKAGE_POSTGRESQL
 >> package/collectd/Config.in:     select BR2_PACKAGE_POSTGRESQL
 >> package/php/Config.ext: select BR2_PACKAGE_POSTGRESQL
 >> package/qt/Config.sql.in:       select BR2_PACKAGE_POSTGRESQL
 >> package/qt5/qt5base/Config.in:  select BR2_PACKAGE_POSTGRESQL

 > Gah, shit indeed. For some reason I assumed postgresql is an
 > application, not a library, so it should not have reverse dependencies.
 > I'll fix that up and resend.

Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
