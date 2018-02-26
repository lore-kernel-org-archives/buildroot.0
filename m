From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 21:38:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-02-23
In-Reply-To: <20180226200816.GA18952@itchy> (Eric Le Bihan's message of "Mon, 
 26 Feb 2018 21:08:17 +0100")
References: <20180224070011.CE6A020881@mail.free-electrons.com>
 <20180226200816.GA18952@itchy>
Message-ID: <87lgffqye8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > Hi!
 > On 2018-02-24 08:00, Thomas Petazzoni wrote:
 >> 
 >> Build failures related to your packages:
 >> 
 >> sparc | skalibs-2.6.3.1 |
 >> http://autobuild.buildroot.net/results/3dd1efc3e418d23c7607905a0e6d176e41dc2abd

 > I can not reproduce the issue. Is this autobuilder using qemu as binfmt?

The autobuilder is gcc67, which uses a (faulty?) Ryzen CPU. Considering
that this is crash and it hasn't happened on any other builders I think
we can ignore this issue.

I have stopped the autobuilder on gcc67 again.

-- 
Bye, Peter Korsgaard
