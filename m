From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:39:55 +0100
Subject: [Buildroot] [PATCH 11/11] package/socat: drop optional readline
 dependency
In-Reply-To: <20191113151724.12155-12-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:24 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-12-peter@korsgaard.com>
Message-ID: <87lfscpb5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > socat is licensed under GPL-2.0, which is not license compatible with
 > readline (GPL-3.0+), so drop the optional dependency and add a comment
 > explaining why.

 > This also matches how socat is packaged in Debian, where the man page has
 > the following snippet added:

 > READLINE

 >   Uses GNU readline and history on stdio to allow editing and reusing input lines (example).
 >   Due to licensing restrictions the readline feature is disabled in Debian.  See BUGS.
 >   You can use STDIO instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
