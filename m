From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:37:44 +0100
Subject: [Buildroot] [PATCH] package/xinetd: add upstream security fix
 for CVE-2013-4342
In-Reply-To: <20201122153038.8350-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 22 Nov 2020 16:30:38 +0100")
References: <20201122153038.8350-1-peter@korsgaard.com>
Message-ID: <87lferu53r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > xinetd does not enforce the user and group configuration directives for
 > TCPMUX services, which causes these services to be run as root and makes it
 > easier for remote attackers to gain privileges by leveraging another
 > vulnerability in a service.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
