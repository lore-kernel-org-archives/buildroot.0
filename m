From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 18:27:43 +0100
Subject: [Buildroot] [PATCH] ezxml: disable mmap code for nommu
In-Reply-To: <20161209102603.16303-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Dec 2016 11:26:03 +0100")
References: <20161209102603.16303-1-peter@korsgaard.com>
Message-ID: <87d1h1f1ww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/8e1/8e10052a0d0ad4f47622925349ec5fddb7b672f0/
 > http://autobuild.buildroot.net/results/2f1/2f15b81beadd2d902c73d6d8bd7fb06b03f62ef5/

 > The mmap support uses madvise which isn't available on nommu uClibc, so disable it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
