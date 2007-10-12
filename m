From: Sushi Sensei <sinestado@gmail.com>
Date: Fri, 12 Oct 2007 16:36:48 -0300
Subject: [Buildroot] haserl don't compile - PATCH
Message-ID: <a63ecaf0710121236y68d8eda2uce4398473307c05b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace index() by strchr() which is C89, if not uClibs don't compile


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071012/ba283879/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-haserl.patch
Type: text/x-patch
Size: 1140 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071012/ba283879/attachment.bin 
