From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 17:12:03 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <200911261004.40246.minimod@morethan.org> (Michael S. Zick's
	message of "Thu\, 26 Nov 2009 10\:04\:36 -0600")
References: <4B0BB941.7090202@dimacosystems.com>
	<200911260927.02506.minimod@morethan.org>
	<87pr758fm1.fsf@macbook.be.48ers.dk>
	<200911261004.40246.minimod@morethan.org>
Message-ID: <87d4358dv0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> Oh, I missed that translation of your post, I thought you said:
 Michael> "do not have the equipment"
 Michael> not that you said:
 Michael> "do not have the time"

 Michael> I guess I will have to start using google translate for this list. ;)

;)

Could you give Luca's .config a try on your 32bit setup and see if you
can reproduce the problem?

http://lists.busybox.net/pipermail/buildroot/attachments/20091124/3fb95d96/attachment.diff

(change the uclibc + busybox configs to their default values, E.G. 
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config")

Thanks.

-- 
Bye, Peter Korsgaard
