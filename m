From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 13:01:52 +0200
Subject: [Buildroot] [PATCH v3] ruby: fix 'pcrel too far' build problem
	on SuperH architectures
In-Reply-To: <2d4efe7ec3764c2fe072.1381664704@argentina> (Thomas De
 Schampheleire's message of "Sun, 13 Oct 2013 13:45:04 +0200")
References: <2d4efe7ec3764c2fe072.1381664704@argentina>
Message-ID: <87ppr8ru8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> The 'pcrel too far' problem detected in the autobuild on SuperH
 Thomas> architectures, seems to be caused by the -Os optimization flag. Using
 Thomas> standard optimization fixes the problem.

 Thomas> Fixes http://autobuild.buildroot.net/results/bc36e051e06f596c2fafdd3cc3745bb34b73ace3/

 Thomas> Investigated-by: Lionel Orry <lionel.orry@gmail.com>
 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas> v3: use intermediate RUBY_CFLAGS variable (thanks ThomasP)
 Thomas> v2: don't try to be smarter than you are (don't change TARGET_CFLAGS)

Committed, thanks.

-- 
Bye, Peter Korsgaard
