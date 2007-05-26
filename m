From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 26 May 2007 11:23:43 +0200
Subject: [Buildroot] Package selection question
In-Reply-To: <200705252245.32243.yann.morin.1998@anciens.enib.fr>
References: <4656F77D.30303@teamboyce.co.uk>
	<200705252151.38804.yann.morin.1998@anciens.enib.fr>
	<20070525203819.GA15885@aon.at>
	<200705252245.32243.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070526092343.GB15885@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 25, 2007 at 10:45:32PM +0200, Yann E. MORIN wrote:
>Bernhard,
>All,
>
>On Friday 25 May 2007 22:38, Bernhard Fischer wrote:
>> On Fri, May 25, 2007 at 09:51:38PM +0200, Yann E. MORIN wrote:
>> >PS. gcc-4.1.x and earlier require neither gmp nor mpfr.
>> Is this true? IIRC the middle-end of 4.1 does use them, no?
>
>I don't have mpfr here and gcc-4.1.2 does build OK. I do have gmp, but gcc does
>not linked against it.

Fair enough, in 4.1, only the fortran frontend needs it.
