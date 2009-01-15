From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 16 Jan 2009 00:16:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
In-Reply-To: <20090115231004.GE12961@cloud.net.au>
References: <20090115062806.91B6E76850@busybox.osuosl.org>
	<1232050311.4757.17.camel@aeglos.sweden.atmel.com>
	<20090115231004.GE12961@cloud.net.au>
Message-ID: <200901160016.48846.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt, 16.01.2009:
> On Thu, Jan 15, 2009 at 09:11:51PM +0100, Ulf Samuelsson wrote:
> > The alsa-lib has to depend on libpython  and libpython
> > has to depend on python.
> 
> Really? The Debian package of alsa-lib (libasound2) doesn't depend on
> libpython.

Gentoo's ebuild has it as optional dependency, description: "Adds
support/bindings for the Python language".
I guess it's not a must-have dependency.

Markus
