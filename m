From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 23:06:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-crontab: new package
In-Reply-To: <20191119165154.1576570-1-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Tue, 19 Nov 2019 16:51:54 +0000")
References: <20191119165154.1576570-1-grzegorz@blach.pl>
Message-ID: <87k17pszct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > Crontab module for reading and writing crontab files and accessing
 > the system cron automatically and simply using a direct API.

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

 > +config BR2_PACKAGE_PYTHON_CRONTAB
 > +	bool "python-crontab"
 > +	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 > +	help
 > +	  Crontab module for reading and writing crontab files and accessing
 > +	  the system cron automatically and simply using a direct API.
 > +
 > +	  https://gitlab.com/doctormo/python-crontab/

I see that there isn't a v2.4.0 tag in git. Can you contact upstream and
get them to push it?

Other than that, the patch looks good. Committed to next, thanks.

-- 
Bye, Peter Korsgaard
