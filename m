From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:07:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/znc: switch to cmake
In-Reply-To: <ced278fa-8fdb-6ece-2134-88df45332ca7@t-online.de>
References: <20190928104106.28327-1-bernd.kuhls@t-online.de>
 <ced278fa-8fdb-6ece-2134-88df45332ca7@t-online.de>
Message-ID: <20190928220708.2e024e97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 22:00:43 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> WANT_I18N enables the C/C++ define HAVE_I18N, but only if Boost.Locale
> and gettext were found:
> https://github.com/znc/znc/blob/master/CMakeLists.txt#L222
> 
> HAVE_I18N was not used by autoconf so we did not lose any features when
> switching to cmake.

OK, thanks for the confirmation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
