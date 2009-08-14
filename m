From: Chris Smith <chris.smith@tandberg.com>
Date: Fri, 14 Aug 2009 09:47:32 +0100
Subject: [Buildroot] Enabling IPv6 doesn't enable it in busybox config
Message-ID: <4A8524A4.6070107@tandberg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shouldn't enabling IPv6 also enable CONFIG_FEATURE_IFUPDOWN_IPV6 in busybox?
inet6 addresses in /etc/network/interfaces don't work otherwise.

-- 

--------------------------------------------------------------------
TANDBERG Telecom UK Ltd
Registered in England and Wales No: 3390345. 
Registered address: 
Unit 2 Pine Trees, Chertsey Lane, Staines, Middlesex, TW18 3HR
