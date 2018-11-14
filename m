From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 09:13:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: Add upstream patch to
 fix CVE-2018-15688
In-Reply-To: <87bm7bdwnh.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 30 Oct 2018 21:09:22 +0100")
References: <20181030175013.7786-1-bernd.kuhls@t-online.de>
 <87bm7bdwnh.fsf@dell.be.48ers.dk>
Message-ID: <87zhuculdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 > Please always add a short description what the CVE is about. I have
 > added:

 > Systemd-networkd is vulnerable to an out out-of-bounds heap write in the
 > DHCPv6 client when handling options sent by network adjacent DHCP
 > servers. A attacker could exploit this via malicious DHCP server to
 > corrupt heap memory on client machines, resulting in a denial of service
 > or potential code execution.

Committed to 2018.02.x and 2018.08.x with the above addition, thanks.

-- 
Bye, Peter Korsgaard
