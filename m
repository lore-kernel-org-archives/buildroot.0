From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 16:17:56 +0100
Subject: [Buildroot] avr32: no selection for Binutils version
In-Reply-To: <4950FEE4.8090900@gmx.at> ("Bernhard =?utf-8?Q?G=C3=B6del=22'?=
	=?utf-8?Q?s?= message of "Tue\, 23 Dec 2008 16\:08\:20 +0100")
References: <4950BD88.2060503@gmx.at> <87vdtb5g53.fsf@macbook.be.48ers.dk>
	<4950FEE4.8090900@gmx.at>
Message-ID: <874p0u53a3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard G?del <bernhard.goedel@gmx.at> writes:

Hi,

 Bernhard> where as in the most recent snapshot it is:

 Bernhard> 	config BR2_BINUTILS_VERSION_2_17
 Bernhard> 		depends on BR2_avr32 || !BR2_nios2
 Bernhard> 		depends on BR2_DEPRECATED && !BR2_avr32
 Bernhard> 		depends on BR2_EXT_BINUTILS_VERSION_2_17
 Bernhard> 		bool "binutils 2.17"

Yes, depending on BR2_avr32 AND !BR2_avr32 is bad - I already mailed
Ulf / the list about this earlier today.

-- 
Bye, Peter Korsgaard
