From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Sep 2007 18:27:51 +0200
Subject: [Buildroot] AVR32 defconfig
In-Reply-To: <1188456153.30555.4.camel@localhost.localdomain>
References: <00ca01c7ea3f$e32af130$6e00a8c0@JONATHAN>
	<1188456153.30555.4.camel@localhost.localdomain>
Message-ID: <20070901162750.GL11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 30, 2007 at 08:42:33AM +0200, Hans-Christian Egtvedt wrote:
>On Wed, 2007-08-29 at 09:24 -0400, Jonathan Dumaresq wrote:
>
><cut Atmel snapshot of Buildroot>
 
>> i probably have setting in the config file that is not correct.
>
>Check what architecture is chosen in uClibc configuration:
>cd toolchain_build_avr32/uClibc-0.9.28.3
>make menuconfig

Generally you should not do this in order not to risk mis-configuration.
See docs/README
