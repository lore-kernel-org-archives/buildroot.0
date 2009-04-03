From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Apr 2009 14:50:24 +0200
Subject: [Buildroot] compiling with older kernel headers and uclibc
In-Reply-To: <898285d30904030431p4195b8fdj60d7275648e54c5@mail.gmail.com>
	(abhishek desai's message of "Fri\, 3 Apr 2009 17\:01\:13 +0530")
References: <898285d30904030431p4195b8fdj60d7275648e54c5@mail.gmail.com>
Message-ID: <87skkp52b3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "abhishek" == abhishek desai <abhi00@gmail.com> writes:

 abhishek> Hi, I am trying to compile uclibc and gcc toolchains(with
 abhishek> gcj) for mipsel architecture using buildroot-2009.02. I
 abhishek> want to use older versions for kernel-headers and uclibc

 abhishek> kernel headers - 2.6.12,

That got removed back on August 4, 2008 (r23020).

 abhishek> uclibc - 0.9.28

We have 0.9.28.3 which is the same as 0.9.28, just with a few
bugfixes.

 abhishek> Even under deprecated versions?make menuconfig does not
 abhishek> provide options for these versions. Is there any method by
 abhishek> which I can use them.

You could check out a svn version earlier than r23020, or use
something a bit more modern than those ancient versions.

-- 
Bye, Peter Korsgaard
