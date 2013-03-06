From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 6 Mar 2013 13:11:57 -0800
Subject: [Buildroot] Pre-compiled XOrg kbd files for read-only targets
Message-ID: <CAJpxd07kzuWMgotZ8LREd5b6mSpE5wKN96Fbm6sdViAw3a532w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have a target with fixed hardware and a read-only file-system that would
really prefer to have a single static keyboard setup. This would ideally
prune the ~2.5MB worth of /usr/share/X11/xkb/* down to a minimum. I've
googled around, and found all kinds of stuff, mostly that linked from xorg's
wiki <http://www.x.org/wiki/XKB>, but I'm apparently not smart enough to
see through all that toward what I'm looking for. All I want is simple
support for a pc104 keyboard in a read-only file-system. How hard can that
possibly be? ;-)

Have any of you all worked out this, or some alternative solution for a
minimal static xkb configuration on a read-only target?

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130306/c1539e8b/attachment.html>
