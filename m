From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 24 Jan 2011 10:02:38 +0100
Subject: [Buildroot] Turning of IPv6 ??
Message-ID: <CE158DD3C2714136AF864134DDAAA2EB@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I have a problem with ipV6 (nslookup takes 10..20 seconds)  if  i disable
ipv6 in busybox only it is solved, so i leave ipv6 in the kernel and uclibc
enabled.
The toplevel setting for ipv6 is also still enabled.
 
When i do a clean build with the config files i saved before the cleaning, i
noticed that the ipv6 is back on in busybox ...
I suspect the toplevel ipv6 setting is causing this and seems to modifie the
busybox setting for ipv6..
 
If everything is build, i change the busybox setting and do a rebuild of
busybox to get it right.
So its anoying i can not use the config files in the first build pas.
 
What can i do about it ?
 
 
Johan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110124/5bbb187b/attachment.html>
