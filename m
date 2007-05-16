From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 15:59:37 +0200
Subject: [Buildroot] download problem
In-Reply-To: <Pine.LNX.4.44.0705161521040.17821-100000@slslc02.psi.ch>
References: <20070516122808.GA9747@aon.at>
	<Pine.LNX.4.44.0705161521040.17821-100000@slslc02.psi.ch>
Message-ID: <20070516135937.GA12536@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 03:27:05PM +0200, Miroslaw Dach wrote:
>Thank you for the suggestion:
>
>I have downloaded the buildroot-snapshot.tar.bz2
>
>I have followed the instruction to make the proper configuration before 
>building the toolchain. 
>
>I have selected powerpc but I did not find anything specific concerning the 
>architecture I would like to use.
>
>The processor I have is the powerpc 405 without Floating Point support.
>Where I can set this settings in order to properly build the toolchain.

BR2_SOFT_FLOAT
BR2_TARGET_OPTIMIZATION

The menuconfig entries have help-text for further information.
