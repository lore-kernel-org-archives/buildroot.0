From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Apr 2015 00:45:30 +0200
Subject: [Buildroot] [PATCH] elfutils: disable symbol versioning for
	uClibc
In-Reply-To: <1429821957-18969-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 23 Apr 2015 23:45:57 +0300")
References: <1429821957-18969-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87383qsbud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > This fixes segfault in xtensa ltrace caused by infinite recursion in the
 > function dwfl_report_elf calling other version of that function.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
