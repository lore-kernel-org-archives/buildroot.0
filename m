From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:21:20 +0100
Subject: [Buildroot] [PATCH 3/4] luajit: only available on x86(-64) hosts
In-Reply-To: <20171102104520.29257-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Nov 2017 11:45:19 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-4-peter@korsgaard.com>
Message-ID: <871skkiyf3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The -m32 compiler flag is used for 32bit builds and host-luajit has limited
 > architecture support, so limit to x86(-64) hosts.

 > Fixes:
 > http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
