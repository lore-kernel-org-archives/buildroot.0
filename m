From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 03 Feb 2009 13:35:25 +0100
Subject: [Buildroot] how to change compiler flags for a specific package
Message-ID: <1233664525.6263.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a question about buildroot. I need to compile a specific package
with different compiler flags than the default. By default -Os is used
in my buildroot setup, but as this triggers a compiler bug when
compiling flac, I would like to change this to -O2 for the flac package
(which uses Makefile.autotools.in). What is the best way to do that?


Sven
