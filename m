From: Willy <willy@willygroup.org>
Date: Thu, 19 Jan 2012 12:42:16 +0100
Subject: [Buildroot] "configure: error: Can't use static libraries for DRI
 drivers" attempting to install X11 intel driver
Message-ID: <CAJSc0StTh6_SEt=vL93-ZbuHvojfEVkma2aP1gPG2t9NK=6H3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
in my buildroot 2011.11 I've tried to install X11 intel video driver.
After that I get the error:
"configure: error: Can't use static libraries for DRI drivers"

Even if I deselect X11 intel video driver the error continues to show and
my building fails every times.

I saw this message:

http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/33419

but I don't understand where I could download the patch (if there is one!)
and how apply to my buildroot.

Regards,
-- 
Willy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120119/96f3d214/attachment.html>
