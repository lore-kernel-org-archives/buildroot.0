From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2013 22:28:22 +0100
Subject: [Buildroot] Can I make USB sound card be available over BT? How?
In-Reply-To: <51216E27.2010508@wp.pl>
References: <51216E27.2010508@wp.pl>
Message-ID: <5123EE76.6020205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 00:56, W.P. wrote:
> Hi there,
> I have following setup:
> router with USB - TP-LINK MR-3220,
> USB 2.0 hub,
> CSR BT USB dongle plugged to hub,
> "USB audio card" plugged to the same hub.
>
> I use (successfully) this "card" to play internet radio (wget | madplay).
>
> Now I want to enable this router to act as HF (stereo, A2DP?) device over
> Bluetooth.
> What modules (programs) I need,
> and most important:how to configure it?
>
> Current software is OpenWRT trunk 33310, compiled at home.
> [I am not "purist", I don't need WWW interface..., so I may switch to
> pure buildroot, if I find the "solution"]
>
> [same question on OpenWRT forum is still w/o response... :( ]

  I guess you may have more success on a bluetooth mailing list... 
Perhaps start with looking at the bleuz_utils documentation.

  Regards,
  Arnout

>
> [BTW, anyone interested in serial(USB maybe) IR transceiver? based on
> ATMega328P, LIRC compatible] - working with ANY serial (including
> USB->serial dongles)
>
> W.P.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
