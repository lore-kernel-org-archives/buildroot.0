From: MikeW <mw_phil@yahoo.co.uk>
Date: Mon, 13 Nov 2006 16:26:29 +0000 (UTC)
Subject: [Buildroot] Configure buildroot to provide /sbin/init (link to
	busybox?)
Message-ID: <loom.20061113T172233-107@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should there be (is there !) a menuconfig way for buildroot to provide
a /sbin/init entry in the filesystem ?
If you don't specify 'init=...' at boot time, the kernel complains
about 'no init'.

Regards,
Mike
