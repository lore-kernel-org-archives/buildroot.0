From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 23:35:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/expect: bump to version 5.45.4
In-Reply-To: <20190729211556.21522-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Jul 2019 23:15:56 +0200")
References: <20190729211556.21522-1-fontaine.fabrice@gmail.com>
Message-ID: <8736in5hog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > * exp_inter.c: [https://sourceforge.net/p/expect/patches/22/]
 > Fix interact bug - handle reads of 0 length on
 > non-blocking channels by explicitly checking if the channel
 > is non-blocking. Fix by Jack Bates.

 > * expect.c: [https://sourceforge.net/p/expect/patches/21/]
 > Fix eof bug introduced with previous bug fix - ensure that data
 > received just before an eof is processed. Fix by Sergei Golovan.

So does this mean that it should be applied to 2019.02.x and 2019.05.x
as well?

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
