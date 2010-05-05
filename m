From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 May 2010 15:44:46 +0200
Subject: [Buildroot] uclibc .9.31 & usleep
In-Reply-To: <000c01caec58$eb209a20$6f01a8c0@apexlaptop> (Sagaert Johan's
	message of "Wed, 5 May 2010 15:43:17 +0200")
References: <000c01caec58$eb209a20$6f01a8c0@apexlaptop>
Message-ID: <87bpcubgz5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> i tried to build a rootfs with the new uclibc 0.9.31
 
 Sagaert> building gdb 6.7.1 failed complaining about usleep 
 Sagaert>  see also this link :
 
 Sagaert> http://old.nabble.com/Problems-with-i686_defconfig-td28240927.html
 
 Sagaert> Should i set something special in the new uclibc config ?

Yes, ensure you're using the uclibc 0.9.31 defconfig
(BR2_UCLIBC_CONFIG). It's the default for new configs, but if you are
reusing an old config it might be wrong.

-- 
Bye, Peter Korsgaard
