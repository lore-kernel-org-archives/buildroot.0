From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 02:31:27 +0300
Subject: [Buildroot] PATCH [2/2] try2: update x11r7 packages to
 use	NAME_PREFIX when calling AUTOTARGETS
In-Reply-To: <20070928204535.GY20951@aon.at>
References: <46FD7109.6000500@promwad.com> <20070928203734.GX20951@aon.at>
	<20070928204535.GY20951@aon.at>
Message-ID: <46FD8ECF.6040802@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ->>+$(eval $(call AUTOTARGETS,x11r7,xdriver_xf86-video-via))
> +>>+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-via))

Updated all bulk x11r7/*/*.mk which use AUTOTARGETS.
Patch is 130KB - it's gzipped to 11KB in the attachement

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: x11r7.diff.gz
Type: application/x-gzip
Size: 11854 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070929/ff1b1c23/attachment.bin 
