From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 17:47:32 +0000 (UTC)
Subject: [Buildroot] Persistent tarball repository - already exists
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
	<loom.20061101T164136-413@post.gmane.org>
	<1f11a5490611010801o629294ffw7cde4e3f98778d16@mail.gmail.com>
	<loom.20061101T171522-277@post.gmane.org>
	<1f11a5490611010841n3a71baeei8d55aa4dc7251330@mail.gmail.com>
Message-ID: <loom.20061101T181702-811@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ashwin Bihari <abihari@...> writes:

> 
> Mike,By all means provide a patch that allows you to change the location of
the DL directory and whether or not it should be deleted during a distclean. I
would definitely find it useful and if others agree, it might get committed.
> Regards-- ~ Ashwin
> 

Apologies to all, I take it all back - there /is/ a menuconfig option,
and if I specify /opt/dl, 'make distclean' does not clean it out !

Nice one, buildroot !

Now, back to the 'unrecognised emulation' problem ... grrr !

Regards,
MikeW
