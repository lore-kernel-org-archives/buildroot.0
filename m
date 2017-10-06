From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Oct 2017 12:57:37 +0000
Subject: [Buildroot] [Bug 10366] dropbear download url has changed
In-Reply-To: <bug-10366-163@https.bugs.busybox.net/>
References: <bug-10366-163@https.bugs.busybox.net/>
Message-ID: <bug-10366-163-r8JIuvWgIr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10366

--- Comment #7 from adyke at harris.com ---
Sure:

>>> dropbear 2017.75 Downloading
--2017-10-06 08:53:56-- 
http://matt.ucc.asn.au/dropbear/releases/dropbear-2017.75.tar.bz2
Resolving matt.ucc.asn.au (matt.ucc.asn.au)... 130.95.13.18,
2405:3c00:5200:100::18
Connecting to matt.ucc.asn.au (matt.ucc.asn.au)|130.95.13.18|:80... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location:
http://192.168.244.187:15871/cgi-bin/blockpage.cgi?ws-session=18446744073228076661
[following]
--2017-10-06 08:53:56-- 
http://192.168.244.187:15871/cgi-bin/blockpage.cgi?ws-session=18446744073228076661
Connecting to 192.168.244.187:15871...

It hangs when trying to connect to the 192.168 address, which must be some
trickery that IT has put in place. It would seem that our firewall is
redirecting me to some sort of infinite loop

-- 
You are receiving this mail because:
You are on the CC list for the bug.
