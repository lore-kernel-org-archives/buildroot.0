From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 11:49:07 +0200
Subject: [Buildroot] [PATCH] package/apache: fixing apxs path mangling
In-Reply-To: <1587717119-16710-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Fri, 24 Apr 2020 10:31:59 +0200")
References: <1587717119-16710-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87wo5mrc30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Latest version of Apache introduce a new apxs with a slightly modified
 > path handling logic. In order to simplify the crosscompilation, the
 > software removes the common prefix from bin install dir and build
 > install dir, but for this to work they both should have a common
 > prefix. So we introduce a new regexp to fix /usr/bin to staging dir,
 > the regexps are also fixed to replace only the exact path between
 > double quotes.a

 > Fixes:
 > http://autobuild.buildroot.net/results/c41f31566974209897a3a1ec35afe2536fb248cc
 > http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
