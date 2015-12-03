From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 22:32:04 +0100
Subject: [Buildroot] [psa] shutting down svn web services
In-Reply-To: <20151202235356.GI23754@vapier.lan> (Mike Frysinger's message of
 "Wed, 2 Dec 2015 18:53:56 -0500")
References: <20151202235356.GI23754@vapier.lan>
Message-ID: <87fuzjb4mj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 > i'm not sure how many people care since it seems to have been broken for a
 > while, but i'm officially turning off svn access via the webserver, as well
 > as the viewvcs instance.  i'm leaving open the raw rsync and svn access as
 > both are trivial to maintain and rely on other services we want to keep.
 > -mike

For Buildroot, disabling svn-over-http is not an issue. Rsync and svn://
also aren't used.

-- 
Bye, Peter Korsgaard
