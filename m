From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 01 Nov 2006 08:25:01 -0700
Subject: [Buildroot] Persistent tarball repository
In-Reply-To: <loom.20061101T151612-639@post.gmane.org>
References: <loom.20061101T151612-639@post.gmane.org>
Message-ID: <1162394701.2945.4.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2006-11-01 at 14:23 +0000, MikeW wrote:
> I found to my annoyance that 'make distclean' clears out your downloaded .tar.gz
> files in /dl, which could be a pain if you hadn't realised that (and was, since
> there appears to be a problem with ftp.kernel.org so I got the file 'manually')
> 
> May I ask if there is a setting to allow these files to be cached somewhere that
> 'distclean' doesn't clear out ?
> Might also be useful on a server in a team environment to ensure everyone
> uses the same reference downloads without local duplication and time penalty.

make clean?
-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
