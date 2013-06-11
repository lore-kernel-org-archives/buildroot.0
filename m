From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Tue, 11 Jun 2013 12:14:25 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch_data: bump to version
	20130602
In-Reply-To: <51B1DE1D.5040703@fh-kl.de>
References: <51B1DE1D.5040703@fh-kl.de>
Message-ID: <51B6F881.7090907@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 07.06.2013 15:20, schrieb Patrick Ziegler:
> drop patch applied upstream
>
> Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
>
The usb_modeswitch_data package selects TCL but actually it doesn't require TCL support.
The wrapper that uses TCL is part of the usb_modeswitch package.

I will create new patches and resubmit.

Best regards
Patrick

-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
