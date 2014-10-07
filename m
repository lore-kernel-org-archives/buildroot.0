From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 22:21:41 +0200
Subject: [Buildroot] [PATCH] ti-utils: link with pthread to avoid build
	failure
In-Reply-To: <1412695448-3117-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Tue, 7 Oct 2014 20:54:08 +0530")
References: <1412695448-3117-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87tx3ffx62.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > Add '-lpthread' option to LIBS in ti-utils.mk file
 > to link this package with pthread

 > Fixes:
 > http://autobuild.buildroot.net/results/132/132072d849a3ec572aa80e51833bf6906a54400a//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
