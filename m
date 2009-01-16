From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 16 Jan 2009 10:28:25 +0100
Subject: [Buildroot] libglibg2 fails
In-Reply-To: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
References: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
Message-ID: <1232098105.6639.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-16 at 08:36 +0100, Ulf Samuelsson wrote:

> Is there anyone capable of building libglib2?

Builds fine for me with the buildroot snapshot from 20090113 and the
patch from https://bugs.busybox.net/show_bug.cgi?id=37
applied. But I guess it would also compile without that patch. Do you
have gettext and libiconv enabled in your build? My .config has
 
 BR2_PACKAGE_LIBICONV=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set


Sven
