From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 31 Oct 2011 10:53:37 -0500
Subject: [Buildroot] [Bug 4429] buildroot 2011.08 does not build on
	Ubuntu 11.10
In-Reply-To: <20111031140530.94A078F3E2@busybox.osuosl.org>
References: <bug-4429-163@https.bugs.busybox.net/>
 <20111031140530.94A078F3E2@busybox.osuosl.org>
Message-ID: <201110311053.39727.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon October 31 2011, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=4429
> 
> --- Comment #3 from Robert Berger <busybox@reliableembeddedsystems.com> 2011-10-31 14:05:30 UTC ---
> When I'm __not__ running screen or byubo, but, just ssh to a machine:
> 
> echo $SHELL
> /bin/bash
> 
> it compiles.
> 
> ---------------------------
> 
> When I'm running byubo (and bash)
> 
> echo $SHELL
> /bin/bash
> 
> it breaks with the funny errors from above.
> 

I may be able to provide more specific information -
I am making this post just as a head's up since it
will take awhile to complete.

I have a Ubuntu-11.04 that I just updated to 'today';
Will rsync those partitions to my external array (under
another distro installed on the machine);
Then back in the Ubuntu installation, upgrade it to 11.10;
Then back in the alternate installation, see if I can spot
what of significance to this problem changed 11.04 --> 11.10

I may not find (or be able to spot) anything at all;
other than my disk drives can do a lot of I/O.
;-)

Mike
