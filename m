From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2009 17:22:43 -0700
Subject: [Buildroot] misc development news
In-Reply-To: <874ox99yko.fsf@macbook.be.48ers.dk>
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
	<874ox99yko.fsf@macbook.be.48ers.dk>
Message-ID: <20090405172243.4a0ba14c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Mar 2009 23:23:03 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> But notice that you don't have write access, so you cannot push
> changes directly. Instead push your changes to your own tree and send
> pull requests to the list. You can add personal repos on uclibc.org by
> storing them in ~/git/ and touching ~/git/<repo>/git-daemon-export-ok,
> after which the hourly cronjob will pick them up and show them in
> cgit.

Ok.

> This is still the case. The aim is currently to close the tree for new
> features and release 2009.05-rc1 sometime in the weekend 24-25th of
> April.

What about bug-fix versions of the latest stable release ? Do we plan
to release things such as 2009.02.1, 2009.02.2, etc. ? When trying
to use 2009.02 for a demo today, I faced several issues that have been
fixed since then. But maybe it's too much burden for the moment ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
