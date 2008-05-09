From: Muktabh Anchlia <m_anchlia@hotmail.com>
Date: Fri, 9 May 2008 17:46:31 +0000
Subject: [Buildroot] Application execution fails
Message-ID: <BAY107-W3500673BC0EFE93C658FB49DD30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
I compiled a cross tool chain for AMD geode processor using buildroot. I wanted to test the cross tools, so wrote a simple hello world application, exported the ...staging-dir/usr/bin/ path and compiled the C code using i686-linux-uclibc-gcc. 

When I run this program on the host machine, it gives me "bad ELF interpreter" as expected. But when I run it on the target, it gives me the following error
"syntax error: "(" unexpected"
I couldn't figure out where I am going wrong.
Any help would be appreciated.

Thanks
Muktabh

" I don't take sides, just the racing line "
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080509/8ff756a8/attachment.htm 
