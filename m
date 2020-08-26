From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:27:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
In-Reply-To: <1597833691-18154-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597833691-18154-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200826232701.1fc77e76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Aug 2020 12:41:31 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> PTraf-ng is a console-based network monitoring program for Linux that
> displays information about IP traffic. It returns such information as:
> 
> - Current TCP connections
> - UDP, ICMP, OSPF, and other types of IP packets
> - Packet and byte counts on TCP connections
> - IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
> - TCP/UDP counts by ports
> - Packet counts by packet sizes
> - Packet and byte counts by IP address
> - Interface activity
> - Flag statuses on TCP packets
> - LAN station statistics

This change is causing one build failure:

  http://autobuild.buildroot.net/?reason=iptraf-ng-1.2.1

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
