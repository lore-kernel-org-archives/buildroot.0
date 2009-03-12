From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Mar 2009 10:25:25 +0100
Subject: [Buildroot] [buildroot question] question about toolchain
	options----large file support
In-Reply-To: <2ae8403e0903120212h78d65edduaa7e2f5a9dde5da1@mail.gmail.com>
	(iamaplayer@gmail.com's message of "Thu\,
	12 Mar 2009 17\:12\:59 +0800")
References: <2ae8403e0903120212h78d65edduaa7e2f5a9dde5da1@mail.gmail.com>
Message-ID: <87k56vt7ne.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "IaMaPlAyEr" == IaMaPlAyEr  <iamaplayer@gmail.com> writes:

Hi,

 IaMaPlAyEr> I want to delete all toolchain_build_mips dir and rebuild
 IaMaPlAyEr> all project,? is the best way ?

You better delete all the build dirs (rm -rf *build_*) to be safe.

 IaMaPlAyEr> and another question is, if i build some package use my own toolchain option,
 IaMaPlAyEr> and after that,
 IaMaPlAyEr> ?i put it on to my origional rootfs, could it works?

So mix applications / libraries with different toolchain options? No,
that generally won't work (you can ofcourse be lucky, but don't count
on it).

-- 
Bye, Peter Korsgaard
