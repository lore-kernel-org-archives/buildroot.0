From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:00:14 +0200
Subject: [Buildroot] [PATCH] gcc: switch to gcc 5.x as the default
In-Reply-To: <1474392342-22755-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 Sep 2016 19:25:42 +0200")
References: <1474392342-22755-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vaxpzqip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > gcc 4.9.4 was the last release of the 4.9.x branch, and the gcc
 > developes will now only be maintaining gcc 5.x and 6.x:

 >   https://gcc.gnu.org/ml/gcc-announce/2016/msg00002.html

 > Therefore, it is time to use gcc 5.x as the default version in
 > Buildroot. We have been having toolchains in the autobuilders with gcc
 > 5.x for a while, so the vast majority of the problems should have
 > already been solved.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
