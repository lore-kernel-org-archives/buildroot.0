From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Feb 2013 17:55:20 +0100
Subject: [Buildroot] build error: "fixdep: permission denied"
In-Reply-To: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
 (Joe Halpin's message of "Wed, 20 Feb 2013 16:22:59 +0000")
References: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
Message-ID: <87mwuzhqmf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joe" == Joe Halpin <jhalpin@luminatorusa.com> writes:

 Joe> When I try to build, I've been getting either this error or "... fixdep: not
 Joe> found". After I get this error, if I run make again, it all completes with no
 Joe> other errors.

 Joe> When I look at the directory, fixdep is there, and has the required
 Joe> permissions. I haven't been able to divine the problem from looking at the
 Joe> makefiles, so if anyone can point me in the right direction I'd appreciate it.

 Joe> I've been googling this, but haven't found a solution yet. I've seen this in
 Joe> 2012.11, 2012.11.1 and 2013.02_rc2.

Funky. Could you please provide some more details about your build setup
(Linux distribution, file system, ..)?

Does it work if you build it in your homedir instead?

-- 
Bye, Peter Korsgaard
