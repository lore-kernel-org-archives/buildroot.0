From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 10:57:11 +0100
Subject: [Buildroot] [PATCH next] python-certifi: add new package
In-Reply-To: <87ioibodrx.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 19 Nov 2014 08:22:42 +0100")
References: <1416255614-4876-1-git-send-email-yegorslists@googlemail.com>
 <20141118230733.3bc8209f@free-electrons.com>
 <546BC6D7.5060909@mind.be>
 <20141119000429.65c6a8c3@free-electrons.com>
 <87ioibodrx.fsf@dell.be.48ers.dk>
Message-ID: <87a93no6mg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> Damn, so the guy doing most of the Python maintenance, and who did
 >> introduce the possibility of building modules with both Python 2 and
 >> Python 3, doesn't have a word into such decisions? Where are we
 >> going? :-)

 > Everything is open for discussion, but why would you want to add it?
 > Consistency?

 > To me it makes pretty good sense that the modules are only visible if
 > python || python3, and the individual modules can add further
 > restrictions if needed (only for python2 or python3, needing some other
 > package or toolchain options).

After discussing it on IRC we agreed that the extra dependencies inside
the package Config.in doesn't make sense, but we should be consistent
all over the tree, so I will remove the extra depends on lines in next.

Thanks.

-- 
Bye, Peter Korsgaard
