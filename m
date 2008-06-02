From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2008 14:11:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
In-Reply-To: <20080601180414.033A73C836@busybox.net> (antab@uclibc.org's
	message of "Sun\, 1 Jun 2008 11\:04\:13 -0700 \(PDT\)")
References: <20080601180414.033A73C836@busybox.net>
Message-ID: <87fxrwf33x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "antab" == antab  <antab@uclibc.org> writes:

Hi,

 antab> Author: antab
 antab> Date: 2008-06-01 11:04:13 -0700 (Sun, 01 Jun 2008)
 antab> New Revision: 22164

 antab> Log:
 antab> Dump php to version 5.2.6 and add SimpleXML extension to config menu

 
 antab> +config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 antab> +	bool "simplexml"
 antab> +	depends on BR2_PACKAGE_PHP
 antab> +	select BR2_PACKAGE_PHP_EXIT_LIBXML2


s/EXIT/EXT ?

package/php/Config.ext:48:warning: 'select' used by config symbol
'BR2_PACKAGE_PHP_EXT_SIMPLEXML' refers to undefined symbol
'BR2_PACKAGE_PHP_EXIT_LIBXML2'

-- 
Bye, Peter Korsgaard
