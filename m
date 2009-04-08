From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Apr 2009 20:51:49 +0200
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <200904081320.48119.lsargent@txdigital.com> (Lloyd Sargent's
	message of "Wed\, 8 Apr 2009 13\:20\:47 -0500")
References: <200904081213.21064.lsargent@txdigital.com>
	<20090408105858.2af75456@surf>
	<200904081320.48119.lsargent@txdigital.com>
Message-ID: <87ljqbyo56.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lloyd" == Lloyd Sargent <lsargent@txdigital.com> writes:

Hi,

 Lloyd> #
 Lloyd> # User Packages
 Lloyd> #
 Lloyd> BR2_PACKAGE_HELLOWORLD=y
 Lloyd> BR2_PACKAGE_WXWIDGETS=y
 Lloyd> BR2_PACKAGE_MIDDLEWARE=y
 Lloyd> BR2_PACKAGE_AVNG=y

Could it be that one of these local packages depends on either dbus or
XSERVER (which depends on dbus)?

-- 
Bye, Peter Korsgaard
