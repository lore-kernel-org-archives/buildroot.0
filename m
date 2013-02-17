From: W.P. <laurentp@wp.pl>
Date: Mon, 18 Feb 2013 00:56:23 +0100
Subject: [Buildroot] Can I make USB sound card be available over BT? How?
Message-ID: <51216E27.2010508@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,
I have following setup:
router with USB - TP-LINK MR-3220,
USB 2.0 hub,
CSR BT USB dongle plugged to hub,
"USB audio card" plugged to the same hub.

I use (successfully) this "card" to play internet radio (wget | madplay).

Now I want to enable this router to act as HF (stereo, A2DP?) device 
over Bluetooth.
What modules (programs) I need,
and most important:how to configure it?

Current software is OpenWRT trunk 33310, compiled at home.
[I am not "purist", I don't need WWW interface..., so I may switch to 
pure buildroot, if I find the "solution"]

[same question on OpenWRT forum is still w/o response... :( ]

[BTW, anyone interested in serial(USB maybe) IR transceiver? based on 
ATMega328P, LIRC compatible] - working with ANY serial (including 
USB->serial dongles)

W.P.
