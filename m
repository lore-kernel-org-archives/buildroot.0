From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 11 Dec 2009 14:37:57 +0100
Subject: [Buildroot] u-boot compile error
Message-ID: <B683F7F8E0BC46E5816B5E39B9B101B3@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
You are using the 4.4.x GCC , the 4.3.x does not cause that error
 
Just change the inline declared functions.
As i remember removing the inline keyword fixes it.
 
Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091211/d42b8256/attachment.htm>
