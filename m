From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 21:13:15 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-3MIMNKlvAV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #4 from Kenric Smith <ksmith@aesaustin.com> ---
Try ntp.vt.edu.

When I try it, I get:


[root ~]# nslookup ntp.vt.edu
Server:    ********
Address 1: ********

Name:      ntp.vt.edu
Address 1: 2001:468:c80:2101:0:14b:a768:154f ntp-1.ipv6.vt.edu
Address 2: 198.82.247.108 ntp-3.vt.edu
Address 3: 198.82.247.51 ntp-1.vt.edu
Address 4: 198.82.247.131 ntp-4.vt.edu
Address 5: 198.82.247.71 ntp-2.vt.edu


[root ~]# ntpd -w -p ntp.vt.edu
ntpd: socket: Address family not supported by protocol

-- 
You are receiving this mail because:
You are on the CC list for the bug.
