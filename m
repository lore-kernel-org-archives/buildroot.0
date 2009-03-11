From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 22:47:19 +0100
Subject: [Buildroot] svn commit: [25617] trunk/buildroot:
	package/qtopia4 target/device/Atmel/arch etc...
In-Reply-To: <20090311213508.40B567645B@busybox.osuosl.org>
	(correa@uclibc.org's message of "Wed\,
	11 Mar 2009 21\:35\:08 +0000 \(UTC\)")
References: <20090311213508.40B567645B@busybox.osuosl.org>
Message-ID: <874oxz91g8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2009-03-11 21:35:07 +0000 (Wed, 11 Mar 2009)
 correa> New Revision: 25617

 correa> Log:
 correa> Let user skip installation of the GUI module for Qtopia

 correa> +config BR2_PACKAGE_QTOPIA4_GUI_MODULE
 correa> +	bool "Gui Module"
 correa> +	help
 correa> +	  Turns on support to Gui applications. If your board don't have
 correa> +	  video output, or you don't require Qt GUI, say n.
 correa> +

Wouldn't you expect most people enabling QT wanting to have this
enabled? E.G. shouldn't it have a 'default y' ?

(I take it that the u-boot stuff was a mistake)

-- 
Bye, Peter Korsgaard
