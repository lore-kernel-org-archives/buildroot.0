From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Jun 2013 12:12:00 +0200
Subject: [Buildroot] github url updates not working?
In-Reply-To: <CAEBucnByEORymsogJXidmPo9dcHRLV64BtySFjKgF=XUgcxZjw@mail.gmail.com>
 (Spenser Gilliland's message of "Fri, 7 Jun 2013 14:46:10 -0500")
References: <CA+-urNRB=OAVN0V_Jy7+kxVGhb1DjzRUpSe9hmisuqnJy7=Wig@mail.gmail.com>
 <CAEBucnByEORymsogJXidmPo9dcHRLV64BtySFjKgF=XUgcxZjw@mail.gmail.com>
Message-ID: <87a9n0di8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:


 Spenser> The SHA1 does not match any commits in the repo.

 Spenser> IE.
 Spenser> git clone git://github.com/antirez/linenoise.git
 Spenser> cd linenoise
 Spenser> git checkout g27a3b4d
 Spenser> error: pathspec 'g27a3b4d' did not match any file(s) known to git.

 Spenser> Therefore, the original author must of put in an invalid commit or the
 Spenser> repo has been rebased since the package was created.  The improper
 Spenser> github handling masked this problem.

Looking at the history, it seems like a 'g' has sneaked in before the
numer. Will fix.

-- 
Bye, Peter Korsgaard
