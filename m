From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 13:41:53 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-29
In-Reply-To: <20170530095148.0f0d4980@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 30 May 2017 09:51:48 +0200")
References: <20170530063003.4239020C46@mail.free-electrons.com>
 <20170530095148.0f0d4980@free-electrons.com>
Message-ID: <87a85ua7we.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> powerpc64 | v4l2grab-f8d8844d52387b3db7... | NOK |
 >> http://autobuild.buildroot.net/results/9eea759992d2c57764156dfeba5682eed8c39797
 >> |

 > Bogus:

 >   sort: write failed: standard output: No space left on device

 > Peter, could you do some cleanup on gcc21 ? :-)

I can try, but for some reason I cannot ssh to the machine right
now. Last week I started looking into moving to the new gcc67/gcc68
machines instead, but I need to build a few host tools manually
(E.G. bc) or get somebody to install them there first.

-- 
Bye, Peter Korsgaard
