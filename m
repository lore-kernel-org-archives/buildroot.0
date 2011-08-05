From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Fri, 5 Aug 2011 14:58:20 +0200
Subject: [Buildroot] Suggestion for easier bumping of Xorg packages
Message-ID: <20110805145820.3bbf8170@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody

What about reorganizing the package/x11r7 subdir?

ie. instead of having everything in the same directory :

xapp_xxx
...
xdriver_xxxx
...
xfont_xxx

maybe it could be clearer to have the same subdirs as the
http://xorg.freedesktop.org/releases/individual/ tree

so that we can bump up versions easier? (one subdirectory after another
since there are many packages)
