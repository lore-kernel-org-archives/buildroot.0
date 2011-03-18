From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2011 17:02:38 +0100
Subject: [Buildroot] Buildroot in use
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835815BCC604@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
	<1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
	<4D82421C.9020704@gmail.com>
	<1D6034426110564DA0DEA9EE9793B3835815BCC604@NBE-MBX01.americas.swk.pri>
Message-ID: <20110318170238.73221b68@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2011 15:42:58 -0400
"Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:

> Another thing I have noticed that is frustrating is that a 'make
> clean' acts more like 'make distclean' and therefore you lose any
> configuration changes you have previously made. 

Not really correct: "make clean" keeps the Buildroot configuration. But
it's true it removes the kernel, Busybox and uClibc configuration files
from their respective build directories.

There has been some proposal to add some sort of "saveconfigs" target,
but the semantic wasn't that all clear.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
