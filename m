From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Feb 2013 11:33:26 +0100
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Thu, 21 Feb
 2013 00:14:23 +0100 (CET)")
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
Message-ID: <87621mhs7d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:


 >> [1] package/libmad/libmad-0.15.1b-optimization.patch.avr32

 Beno?t> This patch was clearly made for specific libmad
 Beno?t> settings. Rather than fixing it, it would be easier to simply
 Beno?t> add a "depends on !BR2_avr32" to the config options that fail
 Beno?t> on AVR32.

Or simply get rid of the huge patch - It's just an optimization, and not
really needed, right?

-- 
Bye, Peter Korsgaard
