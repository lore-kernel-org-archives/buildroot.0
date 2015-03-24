From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 23 Mar 2015 21:58:17 -0500
Subject: [Buildroot] stuttering usb audio raspberry pi
Message-ID: <CAFGceHE6mHrtyBd3wYYWymQssVPXTzRd_EZ2_3ee4bTnU+=3Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all. How do I get rid of stuttering audio on a usb audio device that
is connected to a raspberry pi? My system uses a waveshare32b screen for
the console output that is connected to the gpio ports, and the audio
stuttering happens the worst when there is activity on the screen, like the
output of an mplayer session, to the point the audio is garbled, but not so
much when the console is quiet, but the stuttering is still there, just
intermittently.

I suspect that the culprit could be an IRQ conflict between the usb and
gpio ports or something like that, according to this page:
http://www.linuxjournal.com/node/1000262

Is this the issue, and if yes, how could I reassign them?


I have my current buildroot configuration if this helps.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150323/fe802de6/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 78559 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150323/fe802de6/attachment-0001.obj>
