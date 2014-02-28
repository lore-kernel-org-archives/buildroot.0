From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Fri, 28 Feb 2014 08:57:29 +0100
Subject: [Buildroot] raspberry pi, Qt5 and audio output
Message-ID: <53104169.90506@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
with buildroot Buildroot 2014.02-rc3-00017-g29e5833 and the attached 
.config file I'm able to run Qt5 + webkit application on the RPi.
Still I cannot execute any audio file using Qt5 Multimedia.

I get a warning like this:

defaultServiceProvider::requestService(): no service found for - 
"org.qt-project.qt.mediaplayer"

Anyway I can play any file using aplay, or other players.
Perhaps I miss some qt-related stuff... did someone run into the same 
problem?

Thanks!
Marco

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 49706 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140228/b6a084b9/attachment.wsdl>
