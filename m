From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 17:38:29 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170228161621.GA3533@free.fr> (Yann E. MORIN's message of "Tue, 
 28 Feb 2017 17:16:21 +0100")
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <874lzelmv9.fsf@dell.be.48ers.dk> <20170228161621.GA3533@free.fr>
Message-ID: <87tw7ei83e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2017-02-28 09:51 +0100, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> 
 >> > cmake-3.7 has a bug in how it handles rpath, linking with libraries from
 >> > the host.
 >> 
 >> > Until we completely understand the issue, just blacklist cmake-3.7.
 >> 
 >> > The issue has been reported upstream:
 >> >     http://public.kitware.com/pipermail/cmake/2017-February/064970.html
 >> 
 >> It is a bit painful that we are back to always building cmake on modern
 >> distributions, but OK - Correctness is more important.

 > To be noted: I have a branch that re-introduces cmake-3.7 (and later
 > versions, I hope) and fixes this rpath issue.

 > It works for all types of cmake:

 >   - pre-installed host cmake, tested with 3.1 and 3.7

 >   - built cmake, tested with 3.6 and 3.7

 > I still need to do more testing, as well as proper commit logs. ;-)
 > Expect it Real Soon Now (TM)! :-)

Ok, good - Thanks!

-- 
Bye, Peter Korsgaard
