From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:39:53 +0100
Subject: [Buildroot] [PATCH] mp4v2: add upstream patch fixing build
 issue with gcc 7+
In-Reply-To: <20171114130751.32503-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 Nov 2017 14:07:51 +0100")
References: <20171114130751.32503-1-peter@korsgaard.com>
Message-ID: <87wp2cd8ie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/fc0/fc0f51f3ee1364f55248e8fe713995bc07f877c6/
 > http://autobuild.buildroot.net/results/b0e/b0e68ad2aeb7c191cdaa9856a36bd2cae4bcd5f0/
 > http://autobuild.buildroot.net/results/a66/a66c89e3fb3f1d9802581aaffad87a547c6e67f5/

 > And many more.

 > Add an upstream patch fixing invalid code that now triggers a build error on gcc7+.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
