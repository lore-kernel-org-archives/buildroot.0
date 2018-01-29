From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 09:47:46 +0100
Subject: [Buildroot] [PATCH] dovecot: add upstream security fix for
 CVE-2017-15132
In-Reply-To: <20180128223310.30638-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 28 Jan 2018 23:33:10 +0100")
References: <20180128223310.30638-1-peter@korsgaard.com>
Message-ID: <87bmhd830t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > A flaw was found in dovecot 2.0 up to 2.2.33 and 2.3.0.  An abort of SASL
 > authentication results in a memory leak in dovecot's auth client used by
 > login processes.  The leak has impact in high performance configuration
 > where same login processes are reused and can cause the process to crash due
 > to memory exhaustion.

 > For more details, see:
 > http://www.openwall.com/lists/oss-security/2018/01/25/4

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
