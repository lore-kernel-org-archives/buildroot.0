From: jeff angielski <jeff@theptrgroup.com>
Date: Tue, 24 Feb 2009 09:04:03 -0500
Subject: [Buildroot] Integrating buildroot with source control tools
Message-ID: <1235484243.27200.11.camel@penguin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


How are people integrating their buildroot environments with their
source control tools?

Are you downloading all of the source (make source) and then putting the
entire dl tree under software configuration managemet (SCM)?

Are you creating a local server to house the packages and download from
that server?  Of course putting those packages under SCM on that server?

Or perhaps are you overriding the download commands and perhaps changing
it to git pull or svn checkout?


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
