From: Feng Yang <feng.yang.xb@renesas.com>
Date: Mon, 31 Jan 2011 16:25:59 +0800
Subject: [Buildroot] FW: x11vnc compile error
Message-ID: <35FC1A56EEC91A42A0EB92079193ED8D02E6E24C@ASISML10.asia-idc.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My name is Feng and come from Taiwan, as title, I build x11vnc package
in buildroot-2010.08.

My CPU core is SuperH 4A.

Would you mind give me some suggestion to fix error?

following is the error message.

 

cc1: warning: include location "/usr/include" is unsafe for
cross-compilation

cc1: warning: include location "/usr/include" is unsafe for
cross-compilation

In file included from ../rfb/rfb.h:51,

                 from x11vnc.h:33,

                 from gui.c:3:

/usr/include/pthread.h:655: warning: '__regparm__' attribute directive
ignored

/usr/include/pthread.h:667: warning: '__regparm__' attribute directive
ignored

/usr/include/pthread.h:712: warning: '__regparm__' attribute directive
ignored

In file included from ../rfb/rfb.h:51,

                 from x11vnc.h:33,

                 from connections.c:3:

/usr/include/pthread.h:655: warning: '__regparm__' attribute directive
ignored

/usr/include/pthread.h:667: warning: '__regparm__' attribute directive
ignored

/usr/include/pthread.h:712: warning: '__regparm__' attribute directive
ignored

connections.c: In function 'check_gui_inputs':

connections.c:2024: error: impossible constraint in 'asm'

 

 

 

Regards,

Feng

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110131/7608bae0/attachment-0001.html>
