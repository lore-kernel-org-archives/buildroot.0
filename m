From: David Picard <davepiq@yahoo.fr>
Date: Mon, 6 Jun 2016 10:08:38 +0200
Subject: [Buildroot] autostart program
Message-ID: <c8e799fb-dfdb-1959-7a91-f10507e4b788@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


My platform : Raspberry Pi B+, Adafruit's PiTFT.


I need to start my program, a Qt5 application that uses the touch 
screen, automatically at boot. I can start it with a script in 
/etc/init.d, but it either stops/crashes when I touch the LCD, or the 
touch screen does not respond.

I tried with and without a local console enabled, with no change.

I have 1 user (root) enabled. The programs works well if I start it from 
the local console or remote ssh.

Should I enable autologin first ? I yes, could you give me directions ?

Thanks,
David.
