From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Apr 2010 14:51:08 +0200
Subject: [Buildroot] BR using Codesourcery tool chain
In-Reply-To: <u2q630286c71004210547s451db5d6q80cf4748e8e2c4a6@mail.gmail.com>
	(Nataraj S. Narayan's message of "Wed, 21 Apr 2010 12:47:05 +0000")
References: <u2q630286c71004210547s451db5d6q80cf4748e8e2c4a6@mail.gmail.com>
Message-ID: <874oj57yv7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

 Nataraj> Hi
 Nataraj> I am on armv5tejl GNU/Linux. Changed to Codesourcery toolchain for libc.

 Nataraj> I am able to generate a file system. But the /dev directory is empty.
 Nataraj> For booting using init=/bin/sh , I had to to manually create a
 Nataraj> /dev/console.

So with the exact same config (except for toolchain config) you get
device nodes with the internal toolchain and none with the external one?
What buildroot version are you using?

-- 
Bye, Peter Korsgaard
