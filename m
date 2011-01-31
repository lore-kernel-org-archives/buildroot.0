From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 31 Jan 2011 11:47:38 +0100
Subject: [Buildroot] [git commit master 1/1] fbset: ensure it builds
	after bbox
Message-ID: <834A92027D0447D097FCF621BE848834@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Does this make sense ?
If you change something in busybox , all of bbox symlinks will be
re-generated and overwrite what is already there .
Maybe just rename the native fbset executable to something else to avoid
mixup, or turn it off in bbox
 
Johan
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110131/43221b8c/attachment.html>
