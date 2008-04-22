From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Apr 2008 09:14:16 +0200
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <20080422005042.GA19794@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 22 Apr 2008 10\:50\:42 +1000")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
Message-ID: <8763uaqs3b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> If this is what it is suppose to do, then how to mount the same for NFS
 >> boot. 

 Hamish> You could mount a generated image file somewhere via the loopback
 Hamish> device. Then you would have the devices that are in the image. ext2
 Hamish> would be a good choice. Do you want to write back to the root or not?

 Hamish> Alternatively you could add a new target output format for NFS root.

We already have that - tarball creation.

-- 
Bye, Peter Korsgaard
