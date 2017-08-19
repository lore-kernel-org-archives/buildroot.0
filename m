From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Aug 2017 09:25:24 +0200
Subject: [Buildroot] [PATCH] lttng-tools: update to 2.9.5
References: <20170628131000.GA26783@waldemar-brodkorb.de>
Message-ID: <4o5l6exc8p.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 28 Jun 2017 15:10:00 +0200 schrieb Waldemar Brodkorb:

> Latest release fixed dlmopen detection, so that musl/uClibc-ng
> toolchains can be used.

Hi,

this version bump is still causing build errors with uclibc/musl:
http://autobuild.buildroot.net/?reason=lttng-tools-2.9.5

Regards, Bernd
