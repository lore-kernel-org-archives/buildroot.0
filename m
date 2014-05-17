From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 11:37:47 +0200
Subject: [Buildroot] [PATCH] tstools: uses fork() therefore needs MMU
In-Reply-To: <1400318264-1926-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 11:17:44 +0200")
References: <1400318264-1926-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oaywoidw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.org/results/4f6/4f611e085a3e21319a98f5383adf2caac77a0bd6/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
