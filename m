From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 21:15:02 +0200
Subject: [Buildroot] [PATCH] xmlstarlet: fix static linking
In-Reply-To: <1431790786-17949-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 17:39:46 +0200")
References: <1431790786-17949-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnhk9vwp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Make sure we take into account libgpg-error when linking against
 > libgcrypt, by adding a patch against xmlstarlet configure.ac. The
 > handling of static libraries is clearly horrible in this configure.ac
 > script, using pkg-config would be a lot better, but it's also a lot
 > more work.

 > Fixes:

 >   http://autobuild.buildroot.org/results/931/931dede013d94f88fcb5185dac494775603063ec/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
