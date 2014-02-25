From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 09:01:11 +0100
Subject: [Buildroot] uclibc arm toolchain for windows
In-Reply-To: <CABMiYf82_rKEAzL+ibQs=1PvcDGqWE5HCMuyTDc0_stE8J7Uvw@mail.gmail.com>
 (Jan Pohanka's message of "Tue, 25 Feb 2014 08:53:29 +0100")
References: <CABMiYf82_rKEAzL+ibQs=1PvcDGqWE5HCMuyTDc0_stE8J7Uvw@mail.gmail.com>
Message-ID: <87d2ibliyg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Pohanka <xhpohanka@gmail.com> writes:

 > Hello,
 > I was wondering if it is possible to build cross toolchain with uclibc using
 > buildroot for windows (mingw) or at least get the steps to build same toolchain
 > manually.

Sorry, no. We once had some minimal cygwin support but that has long bit rotten.

 > Unfortunately I'm switching enviroments very often and it would be useful for
 > me if I can rebuild and test some of my apps also from Windows.

Linux in birtualbox is perhaps a solution?

-- 
Bye, Peter Korsgaard
