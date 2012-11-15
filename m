From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 22:02:52 +0100
Subject: [Buildroot] [PATCH for-2012.11 1/1] grantlee: fix -lpthread
	build error
In-Reply-To: <1353001295-8337-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 (Zoltan Gyarmati's message of "Thu, 15 Nov 2012 18:41:35 +0100")
References: <1353001295-8337-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <87haoq37gj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

 Zoltan> Fixing linking time error with certain toolchains. The issue caused by a missing explicit linking to
 Zoltan> libpthread. The failed buildlog:

Committed, thanks.

-- 
Bye, Peter Korsgaard
