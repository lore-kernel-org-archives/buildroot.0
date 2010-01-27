From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 27 Jan 2010 12:27:17 +0000
Subject: [Buildroot] PATCH: Add more config options to alsa, bump version
Message-ID: <4B603125.6070002@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a lot of extra config options to alsa-lib (default 
should be the same as before options existed), with these you can 
substantially reduce the size of the alsa-lib library.

It also changes alsa-utils to only depend on ncurses if you have 
alsa-mixer selected.

Finally it bumps the version of alsa-lib and alsa-utils to 1.0.22
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0015-bump-alsa-version-add-options.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100127/56484916/attachment.diff>
