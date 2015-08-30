From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 00:41:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/bootutils: fix musl compilation
	issue
In-Reply-To: <1440963380-6449-1-git-send-email-brendanheading@gmail.com>
 (Brendan Heading's message of "Sun, 30 Aug 2015 20:36:20 +0100")
References: <1440963380-6449-1-git-send-email-brendanheading@gmail.com>
Message-ID: <87r3mks8lf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/389/38914a0a7ff0aa79acbbbe6c46ab701325dfceb8/
 > http://autobuild.buildroot.net/results/c0d/c0d09f5dd0e26c0d2454ebb2ea5317db1135db89/

 > musl requires strict inclusion of <sys/types.h> for makedev(3).

 > note - upstream project appears dead since 2009.

 > Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
