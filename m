From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Tue, 5 Jul 2011 00:42:18 +0200
Subject: [Buildroot] DNS resolv issue with localhost
Message-ID: <23843298-AAFD-4E03-A77D-2883BBA856B2@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have a LEON3 / XILINX Virtex / Buildroot Linux running on my fpga.

I have a weird issue with localhost :

When there is no default route, ping localhost works fine.
When I set a default route (route add default gw 1.2.3.4), ping localhost doesnt work anymore (but ping 127.0.0.1 still does).

I have checked my /etc/hosts and my /etc/network/interfaces, they are fine :

auto lo
iface lo inet loopback

hosts :
127.0.0.1 localhost


What am I missing ? 

Thanks.
