From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Apr 2008 09:54:21 +0200
Subject: [Buildroot] Improper device nodes
	created	insideproject_build_arm/uclibc/root/dev/
In-Reply-To: <20080422015601.GA20995@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 22 Apr 2008 11\:56\:01 +1000")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<5BF78BCE8D9BF14A83F836BD9E3916BA0DDC58@blrms.slti.sanyo.co.in>
	<20080422015601.GA20995@cloud.net.au>
Message-ID: <871w4yqq8i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> > The build process is not intended to create proper device nodes on
 >> desk (non-root user can't do that)
 >> i have logged into console with su root. i am using root shell for this
 >> 
 >> root at guru_vlinux:/opt/buildroot_plain# whoami
 >> root

Don't compile as root! Or atleast, don't come complaining when we make
a typo somewhere and accidently remove something critical on your
machine like /lib ;)

-- 
Bye, Peter Korsgaard
