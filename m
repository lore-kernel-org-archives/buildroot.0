From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jan 2012 15:09:07 +0100
Subject: [Buildroot] [PATCH 1/1] valgrind: bump to 3.7.0 and fix build
	with ccache
In-Reply-To: <6d753f5cb4dcbda5715d538bf956f72ec82bbcf5.1325340331.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 31 Dec 2011 15:07:08 +0100")
References: <cover.1325340331.git.thomas.petazzoni@free-electrons.com>
 <cover.1325340331.git.thomas.petazzoni@free-electrons.com>
 <6d753f5cb4dcbda5715d538bf956f72ec82bbcf5.1325340331.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87d3b22o3g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> After bumping to 3.7.0, the
 Thomas> valgrind-3.6.1-configure-support-linux-3.patch is no longer
 Thomas> necessary since it was added upstream. The
 Thomas> valgrind-3.7.0-compiler-check.patch patch is added to fix a
 Thomas> compiler version check issue (patch taken from the upstream
 Thomas> Subversion repository). The
 Thomas> valgrind-3.7.0-fix-ccache-support.patch is added to fix the
 Thomas> build process when ccache is used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
