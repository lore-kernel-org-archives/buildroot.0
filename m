From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 16:41:07 +0200
Subject: [Buildroot] network-manager-applet for buildroot almost ready
Message-ID: <51263203.4070709@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!

I have network-manager-applet running and it appears into fluxbox system
tray but
it does not detect any networks.

When starting it from terminal it spits the following:

** Message: applet now removed from the notification area
** Message: applet now embedded in the notification area

** (nm-applet:766): WARNING **: Failed to register as an agent: (32) No
session found for uid 0

Does that "No session found for uid 0" mean that there is something
wrong with dbus ????

Or is that error related to consolekit ?

I have it here running too (and soon will submit to buildroot)
Also running are NetworkManager and dbus.

I start fluxbox with normal startx command and I have just "exec
/usr/bin/startfluxbox" in my .xinitrc file.


Regards
Stefan
