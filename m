From: Daniel Ng <daniel_ng11@lycos.com>
Date: Fri, 8 Aug 2008 02:24:39 +0000 (UTC)
Subject: [Buildroot] IPv4 Unnumbered Multicast?
Message-ID: <loom.20080808T022349-632@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Would someone please tell me if the latest uClibc is able to handle Multicast 
IGMP Joins and sending of Multicast packets on multiple Unnumbered PPP links?

As you probably know, for IPv4, Unnumbered PPP links 'share' the IP address of 
another interface on the same machine. Therefore, you could potentially have 
multiple PPP links on one machine, all with exactly the same local IP address. 
We might want any number of these PPP interfaces to join the same Multicast 
Group.

Can we multicast send/receive in this scenario? The setsockopt() 
IP_MULTICAST_IF and IP_ADD_MEMBERSHIP options only seem to distinguish 
interfaces by their IP address.

Cheers,
Daniel
