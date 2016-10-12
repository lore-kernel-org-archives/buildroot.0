From: Jack <jackzzjack@gmail.com>
Date: Wed, 12 Oct 2016 14:08:06 +0800
Subject: [Buildroot] iptables issue on buildroot-2016.05
Message-ID: <CADZ=QZmmiwCHEYdu3UXZvTkRGjaoTwVdkywj0sNo0G4BppPQhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I use buildroot-2016.05 version, and I got a issue with iptables.

The buildroot-2016.05 iptables version is v.1.6.0.
When I try to type "iptables -A FORWARD -p udp -s 192.168.1.2 --sport
3000 -j DROP", it shows "iptables v1.6.0: Port "3000" does not resolve
to anything.".
It seems iptables may have some trouble in v.1.6.0.

I already tried v1.4.16.3. It works very well. Have I create a ticket
on iptables issue tracker ? Or it's just about buildroot iptables
problem ?
