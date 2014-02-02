From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2014 20:50:37 +0100
Subject: [Buildroot] [git commit] package/joe: Add package for the JOE
	editor
In-Reply-To: <20140202171004.44f5d381@skate> (Thomas Petazzoni's message of
 "Sun, 2 Feb 2014 17:10:04 +0100")
References: <20140202144314.AB1249C730@busybox.osuosl.org>
 <20140202171004.44f5d381@skate>
Message-ID: <874n4hqooi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Sun, 2 Feb 2014 15:42:46 +0100, Peter Korsgaard wrote:

 >> +JOE_VERSION = 3.7
 >> +JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 >> +JOE_LICENSE = GPLv1+
 >> +JOE_LICENSE_FILES = COPYING

 > Is this really GPLv1+ ? It is indeed GPLv1, but I'm wondering about the
 > "+", as I haven't seen any indication in the code about this.

grep -rls 'any later'                                           ~/source/buildroot/output/build/joe-3.7
mouse.h
config.sub
mouse.c
COPYING
missing
depcomp
config.guess

It also fits with what Debian has listed in /usr/share/doc/joe/copyright:

This is the Debian prepackaged version of joe. This package was previously
maintained by Christian Linhart, Michael Meskes and Dale Scheetz.
Current maintainer is Josip Rodin <joy-packages@debian.org>.

Original sources can be found at http://joe-editor.sourceforge.net/

   Copyright (C) 1992, 1995 Joseph H. Allen
   Portions Copyright (C) 2001 Marek 'Marx' Grac

   JOE is free software; you can redistribute it and/or modify it under the
   terms of the GNU General Public License as published by the Free Software
   Foundation; either version 1, or (at your option) any later version.

   JOE is distributed in the hope that it will be useful, but WITHOUT ANY
   WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
   FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
   details.

So I think it's OK.

-- 
Peter Korsgaard 
