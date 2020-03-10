From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:30:04 +0100
Subject: [Buildroot] [PATCH v2] package/grep: fix busybox aliasing
In-Reply-To: <1580822081-3713-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 4 Feb 2020 14:14:41 +0100")
References: <1580822081-3713-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87eeu0q7g3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > When grep package is selected, it should be installed at the same exact
 > location where busybox installs it too, this way the grep/egrep/fgrep
 > executables will end up overwriting the busybox provided ones.
 > Busybox installs *grep executables in /bin, grep package in /usr/bin.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
