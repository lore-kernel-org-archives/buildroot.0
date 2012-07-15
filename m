From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Mon, 16 Jul 2012 00:54:21 +0200
Subject: [Buildroot] log4cxx, xcursor-transparent-theme package to add
Message-ID: <jtvhmt$u1m$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

this is my first time adding package to community so hope I'm doing all 
well.
This time I'd like to contribute with two projects:
* Apache log4cxx (includes additional two depending libraries and 
log4cxx patch)
* xcursor-transparent-theme (includes patch for cross-compile)
that I use on my project. My project is based on BR 2011.05 version so I 
assume patch cannot be applied to latest version directly. I also tested 
packages only on version 2011.05 including x86 and arm(didn't try with 
xcursor-transparent-theme) configuration with glibc.
I hope BR community will have benefit from this.

Regards,

Aleksandar
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: xcursor-transparent-theme.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/0a1b6c14/attachment-0002.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log4cxx.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/0a1b6c14/attachment-0003.ksh>
