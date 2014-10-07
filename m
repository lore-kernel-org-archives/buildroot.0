From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 16:22:37 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: fix build breakage on uClibc
	without backtrace
In-Reply-To: <1412691197-5776-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 Oct 2014 11:13:17 -0300")
References: <1412691197-5776-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oatogdsi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > uClibc has optional support for backtrace() hence on default
 > configurations where it's disabled it'll fail.
 > Add patch to make backtrace support conditional and disable it for
 > uClibc-based builds since it's mostly for debugging purposes. Fixes:
 > http://autobuild.buildroot.net/results/325/32523398a8c66a7ac6d3e789332d1b57e090aef1/

 > Patch status: sent upstream.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
