From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:10:45 +0100
Subject: [Buildroot] [PATCH] package/tmux: add upstream security fix for
 CVE-2020-27347
In-Reply-To: <20201112092146.31467-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Nov 2020 10:21:45 +0100")
References: <20201112092146.31467-1-peter@korsgaard.com>
Message-ID: <87blg0axt6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2020-27347: The function input_csi_dispatch_sgr_colon() in file
 > input.c contained a stack-based buffer-overflow that can be exploited by
 > terminal output.

 > For details, see:
 > https://www.openwall.com/lists/oss-security/2020/11/05/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
