From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 20:52:18 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/pkg-cmake.mk: set the {C, CXX,
	LD}FLAGS for host packages
In-Reply-To: <1408653920-18954-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 21 Aug 2014 22:45:17 +0200")
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87a95jwpb1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

I do agree with Yann though that it would be good if the commit messages
were more detailed. Why do we use a toolchain files for target, but not
for host?

-- 
Bye, Peter Korsgaard
