From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:34:35 +0100
Subject: [Buildroot] [PATCH] openocd: add security fix for CVE-2018-5704
In-Reply-To: <20180128220256.2198-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 28 Jan 2018 23:02:56 +0100")
References: <20180128220256.2198-1-peter@korsgaard.com>
Message-ID: <87fu6m6wbo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Open On-Chip Debugger (OpenOCD) 0.10.0 does not block attempts to use HTTP
 > POST for sending data to 127.0.0.1 port 4444, which allows remote attackers
 > to conduct cross-protocol scripting attacks, and consequently execute
 > arbitrary commands, via a crafted web site.

 > For more details, see:
 > https://sourceforge.net/p/openocd/mailman/message/36188041/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
