From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 05 Jan 2010 09:26:14 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
Message-ID: <4B42F7A6.1010100@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

peter.stosz at mentat.hu a ?crit :
>
> When I test it with our very simple usb test program, nothing happen.
> I try to "test" it with lsusb, nothing too.
For lsusb: do you have "/var/lib/misc/usb.ids" or an equivalent on your
system ?
For your usb test program you should probably give it a try with:
    # strace us

Regards,
Julien
