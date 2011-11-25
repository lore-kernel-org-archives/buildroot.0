From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 26 Nov 2011 00:18:17 +0100
Subject: [Buildroot] usbutils fails to build : undefined reference to
	program_invocation_short_name :Solved
Message-ID: <9A71B9B3496A4FC7A9183A64586BFD3F@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

Just in case someone else bumps into the same :

 

I stumbled on building usbutils , seems  similar like in Digest Vol 62 issue
28 described by Sven.

 

program_invocation_short_name seems to be undefined.

 

I found that __programname and invocation name where disabled in my ?Clibc
config.

 

Regards ,

 

Sagaert Johan

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111126/b33604b0/attachment.html>
