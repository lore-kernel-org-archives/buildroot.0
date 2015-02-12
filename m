From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 22:28:34 +0100
Subject: [Buildroot] [PATCH] python3: fix invalid ncursesw header path
In-Reply-To: <1423430604-5896-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 8 Feb 2015 22:23:24 +0100")
References: <1423430604-5896-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2zmzunx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to python3 that makes sure it does not use an
 > invalid header path (pointing to host headers) when including ncursesw
 > support.

 > Fixes:

 >   http://autobuild.buildroot.org/results/9bd/9bdaa392e8dd00c6ebee156b758e3c0cac480237/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
