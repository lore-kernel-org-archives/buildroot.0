From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Sep 2009 11:06:48 +0200
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
In-Reply-To: <A41BAEC7EC0449D8BB97311F11270777@apexjs> (Sagaert Johan's
	message of "Thu\, 10 Sep 2009 10\:54\:11 +0200")
References: <A41BAEC7EC0449D8BB97311F11270777@apexjs>
Message-ID: <87bpljw4lz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert>  Hi Peter 
 
 Sagaert> I ran it outside buildroot to find the problem, from inside
 Sagaert> buildroot same problem

 Sagaert> export CROSS_COMPILE=arm-linux-
 Sagaert> make clean
 Sagaert> make at91sam9260ek_nandflash_config
 Sagaert> make

So that sounds as if it's a problem with u-boot, and nothing to do with
buildroot.

Perhaps you could ask on the u-boot list if that's a known problem?

 Sagaert> I understand, it's a huge project and i what works for one
 Sagaert> target could be broken for another one.  Thats the price to
 Sagaert> pay when trying to use the 'latest' stuff.... :)

Yes unfortunately. Thanks a lot for doing this early testing.

-- 
Bye, Peter Korsgaard
