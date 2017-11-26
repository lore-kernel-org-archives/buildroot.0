From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:21:12 +0100
Subject: [Buildroot] [git commit] libidn: fix build with gcc 7.x
In-Reply-To: <20171102200955.1D852804EF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 2 Nov 2017 21:16:20 +0100")
References: <20171102200955.1D852804EF@busybox.osuosl.org>
Message-ID: <87zi79ieev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=11ed80169ca788d2b9ac448fb545485c44876be9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes:

 >   http://autobuild.buildroot.net/results/f7fc775584ad35349f0d66ed8632ab18f3859f9c/

 > Note: this problem wasn't seen until now because we were only testing
 > gcc 7.x/glibc, and the problematic code is not built when glibc is
 > used.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
