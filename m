From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 23:33:52 +0100
Subject: [Buildroot] [PATCH 1/2] opencv: need threads support
In-Reply-To: <1391638693-12997-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 5 Feb 2014 23:18:12 +0100")
References: <1391638693-12997-1-git-send-email-s.martin49@gmail.com>
Message-ID: <874n4d1967.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Because the opencv_core module needs threads support, just globally
 > disable the whole opencv package if the toolchain does not offer this
 > support.

 > Fixes:
 >   http://autobuild.buildroot.org/results/8dd/8dd1674674018a931ba09cc5b414c32360e51692/build-end.log

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
