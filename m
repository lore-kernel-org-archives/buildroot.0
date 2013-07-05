From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Jul 2013 15:30:52 +0200
Subject: [Buildroot] [PATCH] Add 'bc' in the mandatory dependencies
In-Reply-To: <1373014089-4489-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 5 Jul 2013 10:48:09 +0200")
References: <1373014089-4489-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obahjfqr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since a few kernel releases, having 'bc' installed is mandatory to
 Thomas> build the kernel. See commit
 Thomas> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=70730bca1331fc50c3caacaea00439de1325bd6e
 Thomas> of the kernel.

 Thomas> Since this tool is generally available by default in distributions,
 Thomas> and we're unlikely to see version-specific problems with it, we
 Thomas> just check for it to be installed in
 Thomas> support/dependencies/dependencies.sh.

Committed, thanks.

-- 
Bye, Peter Korsgaard
