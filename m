From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 22:34:02 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 5.1.2
In-Reply-To: <51A50B83.3010106@mind.be> (Arnout Vandecappelle's message of
 "Tue, 28 May 2013 21:54:43 +0200")
References: <20130528130059.6B3E39A61F@busybox.osuosl.org>
 <51A50B83.3010106@mind.be>
Message-ID: <87zjve9745.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 28/05/13 14:59, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=78927d3f92f0a397e9551dee491e26602e63a30a
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 Arnout>  How come this version bump is applied to master instead of next?

Argh, because I screwed up.

The gmp, mpg123 and sqlite bumps belong on next. Will revert.

Thanks.

-- 
Bye, Peter Korsgaard
