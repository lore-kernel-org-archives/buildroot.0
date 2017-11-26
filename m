From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:14:01 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: update config.guess / config.sub
In-Reply-To: <20171106141710.6029-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 6 Nov 2017 15:17:09 +0100")
References: <20171106141710.6029-1-peter@korsgaard.com>
Message-ID: <87lgisg2ue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/284/284876bd649cab26e5ecd696c03c71c077ea7411/

 > The build system doesn't use autotools, but does use an old version of
 > gnuconfig which doesn't know all the architectures supported by Buildroot,
 > so update config.guess / config.sub like we do in pkg-autotools.mk

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
