From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 26 Sep 2007 00:14:48 +0200
Subject: [Buildroot] [Libusb PATCH] for revision 20000
In-Reply-To: <1190724479.19731.25.camel@elrond.atmel.sweden>
References: <46F87262.20806@gmail.com>
	<1190724479.19731.25.camel@elrond.atmel.sweden>
Message-ID: <20070925221448.GC20599@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 25, 2007 at 02:47:59PM +0200, Ulf Samuelsson wrote:
>m?n 2007-09-24 klockan 23:28 -0300 skrev Rex Luscus:
>> To compile tests must have the libs in stagedir but is impossible to
>> copy libs before to compile tests!!!
>> Tests are not used and ignored in the package copy. This patch omit this 
>> compilation
>> (There are not an option in configure file of package to omit this)
>> This patch update my yesterday patch
>> 
>
>I modified it to SED the LIBUSB/tests/Makefile.in 
>which should give the same end result.
>libusb now build for ARM.

Thanks. Please act on eventually open issues in http://bugs.uclibc.org
that are concerned about libusb
