From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 14:15:19 +0200
Subject: [Buildroot] precompiled kernel headers
In-Reply-To: <4ADE49D7.10001@cs.ucsb.edu> (Roman Chertov's message of "Tue\,
	20 Oct 2009 16\:37\:59 -0700")
References: <4ADDE87E.1030601@cs.ucsb.edu> <4ADE49D7.10001@cs.ucsb.edu>
Message-ID: <87iqe9q6y0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 Roman> Hello,
 Roman> I have the following question regarding buildroot-2009.08.  If a kernel
 Roman> is selected why does the script download the 2.6.30.5 precompiled
 Roman> headers anyway?

Because you have two selections:

1: What kernel headers to use to build uclibc/toolchain
2: What kernel (if any) to build next to rootfs

-- 
Bye, Peter Korsgaard
