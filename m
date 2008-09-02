From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Sep 2008 15:29:06 +0200
Subject: [Buildroot] Make error
In-Reply-To: <ed4892840808310213w4e9edea5wa69beac5ebf7c7eb@mail.gmail.com>
	(Steven Woody's message of "Sun\, 31 Aug 2008 17\:13\:20 +0800")
References: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
	<87od3966tr.fsf@macbook.be.48ers.dk>
	<ed4892840808310034y2b352388q9dd2ff90a614ee13@mail.gmail.com>
	<ed4892840808310213w4e9edea5wa69beac5ebf7c7eb@mail.gmail.com>
Message-ID: <87bpz6vfq5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steven" == Steven Woody <narkewoody@gmail.com> writes:

Hi,

 Steven> Wait a moment ...!   After I turned on the 'avahi' in networking
 Steven> section and run make, I got the following error instead:

 Steven> cannot find -lintl
 Steven> collect2: ld returned 1 exit status
 Steven> make[3]: *** [libavahi-common.la] Error 1

 Steven> What do I do? Thanks.

Strange. Avahi should depend (and select) libintl if you use a
toolchain with locales enabled. Could you post your config please?

-- 
Bye, Peter Korsgaard
