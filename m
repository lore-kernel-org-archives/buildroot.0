From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 14:37:18 +0200
Subject: [Buildroot] [PATCH 3/4] bluez5_utils: allow enabling formerly
	experimental plugins
In-Reply-To: <1dc2f9ce76c1cb1c4be2e05509b816445a31fec4.1493643541.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 1 May 2017 15:59:43 +0300")
References: <cover.1493643541.git.baruch@tkos.co.il>
 <1dc2f9ce76c1cb1c4be2e05509b816445a31fec4.1493643541.git.baruch@tkos.co.il>
Message-ID: <878tmbtr7l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 > Disregard to increase just minor version BlueZ 5.44 is drastically different in
 > a way what plugins that used to be enabled by the --enable-experimental
 > configure option, now have their own option.

 > Extend Buildroot package to cover these plugins.

 > Cc: Marcin Bis <marcin@bis.org.pl>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
