From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:57:02 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/nfs-utils: fix unnecessary
 files removal
In-Reply-To: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Sun, 28 Apr 2019 11:02:54 +0200")
References: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87v9yir5sh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Removing of unnecessary files is actually broken by the fact that the rm
 > command is executed inside build directory and not the target directory.

 > This patch fixes the problem changing to target directory before
 > removing files.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 > v3-> v4: separate fix patch as requested by Arnout

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
