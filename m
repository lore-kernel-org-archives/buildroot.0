From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 21 Jan 2009 09:36:15 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232523725.11888.11.camel@elrond.atmel.com>
References: <1232523725.11888.11.camel@elrond.atmel.com>
Message-ID: <1232526975.6326.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-01-21 at 08:42 +0100, Ulf Samuelsson wrote:
> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
> wchar, largefile,ipv6, NWFPE

We are building for ARM as well, using gcc 4.3.2, uclibc-0.9.30, wchar,
largefile, !ipv6. 

> Some key packages that I do not get to build are

> alsa-utils          "Depends on alsa-lib"

alsa-lib builds for me. Yesterday we updated to version 1.0.19, the
latest stable release, and that version also compiles nicely. Perhaps
you might want to try that update in buildroot?


Sven
