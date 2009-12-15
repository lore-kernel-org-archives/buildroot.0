From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Dec 2009 01:37:44 +0100
Subject: [Buildroot] mtd bump : ubimirror
Message-ID: <25C4C9D18DF84EDC93094E6EF0ABF627@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I think the Config.in needs some tweaking :
 
ubimirror no longer exists in the new mtd tools, but is still in the config
menu.
and ubiformat is an added one ,maybe there are more things added not in the
config menu yet.
and the mtd-utils-all-targets.patch should be removed i think.
 
Regards ,Johan
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091215/80b63671/attachment.htm>
