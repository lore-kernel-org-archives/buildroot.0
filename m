From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Nov 2009 19:55:18 +0100
Subject: [Buildroot] [PATCH] libglib2: bump version number to 2.22
In-Reply-To: <1259073157-19511-1-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Tue\, 24 Nov 2009 15\:32\:37 +0100")
References: <1259073157-19511-1-git-send-email-daniel@caiaq.de>
Message-ID: <877htfda7d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> When building gvfs, I encountered the following error:
 Daniel>   checking for GLIB... configure: error: Package requirements (glib-2.0 >= 2.21.2 gthread-2.0 gobject-2.0 gmodule-no-export-2.0 gio-unix-2.0 gio-2.0 ) were not met:
 Daniel>   Requested 'glib-2.0 >= 2.21.2' but version of GLib is 2.20.5

Thanks, but the new libglib2 version needs ipv6 support to build and
might cause other problems, so I'm selecting the safe option and simply
revert the gvfs update for now.

We can do the update after 2009.11.

-- 
Bye, Peter Korsgaard
