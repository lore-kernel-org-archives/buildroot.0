From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 16:34:14 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <200911260927.02506.minimod@morethan.org> (Michael S. Zick's
	message of "Thu\, 26 Nov 2009 09\:27\:00 -0600")
References: <4B0BB941.7090202@dimacosystems.com>
	<4B0E5618.4010605@dimacosystems.com>
	<87tywh8i25.fsf@macbook.be.48ers.dk>
	<200911260927.02506.minimod@morethan.org>
Message-ID: <87pr758fm1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 >> If not, it sounds like something goes wrong with the openssl
 >> compilation and something gets confused about host/target.
 >> 
 >> I haven't been able to reproduce it with your config, but I'm on a
 >> x86-64 host, so that might be why - Sorry, I don't have any 32bit
 >> PCs any more.

 Michael> Sure you do, it is hidden inside of your x86_64 box.  ;)

 Michael> Install the Linux-Vserver patch, set the option to emulate 32bit 
 Michael> in your kernel config, build and boot kernel, install your choice
 Michael> of 32bit distributions in an ARCH=x86 guest context.

 Michael> I currently run Gentoo-32bit, Debian-32bit, Ubuntu-32bit on my
 Michael> x86-64 box (all at the same time). It is a Core2Quad box.
 Michael> Ah, yes, I also run the same threesum in 64bit also at the same time.

Sure, or just powering up a kvm instance. I'm not saying it cannot be
done, it will just take me longer than the spare time I have today to
do a 32bit install with the dependencies and do a rebuild.

-- 
Bye, Peter Korsgaard
