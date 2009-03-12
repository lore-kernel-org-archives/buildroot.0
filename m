From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Mar 2009 11:29:28 +0100
Subject: [Buildroot] [buildroot question] question about toolchain
	options----large file support
In-Reply-To: <20090312112246.302f8f2d@surf> (Thomas Petazzoni's message of
	"Thu\, 12 Mar 2009 11\:22\:46 +0100")
References: <2ae8403e0903120212h78d65edduaa7e2f5a9dde5da1@mail.gmail.com>
	<87k56vt7ne.fsf@macbook.be.48ers.dk> <20090312112246.302f8f2d@surf>
Message-ID: <87fxhjt4on.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> You better delete all the build dirs (rm -rf *build_*) to be safe.

 Thomas> Is there any "make somethingclean" to do that ? I also frequently end
 Thomas> up doing rm -rf *build_*.

make distclean afaik does.

-- 
Bye, Peter Korsgaard
