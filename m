From: Tom <fivemiletom@gmail.com>
Date: Fri, 25 May 2007 14:10:45 -0700
Subject: [Buildroot] Package selection question
In-Reply-To: <200705252245.32243.yann.morin.1998@anciens.enib.fr>
References: <4656F77D.30303@teamboyce.co.uk>	<200705252151.38804.yann.morin.1998@anciens.enib.fr>	<20070525203819.GA15885@aon.at>
	<200705252245.32243.yann.morin.1998@anciens.enib.fr>
Message-ID: <465750D5.80409@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have selected "Buildroot toolchain" and in the toolchain->GCC option I 
have selected 4.1.2.

(HOSTCC I have tried both 3.4.4 and 4.2.0)

Why does it download and try to build mpfr if it is not used?


Yann E. MORIN wrote:
> Bernhard,
> All,
> 
> On Friday 25 May 2007 22:38, Bernhard Fischer wrote:
>> On Fri, May 25, 2007 at 09:51:38PM +0200, Yann E. MORIN wrote:
>>> PS. gcc-4.1.x and earlier require neither gmp nor mpfr.
>> Is this true? IIRC the middle-end of 4.1 does use them, no?
> 
> I don't have mpfr here and gcc-4.1.2 does build OK. I do have gmp, but gcc does
> not linked against it.
> 
> Regards,
> Yann E. MORIN.
> 
