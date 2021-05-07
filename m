From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 May 2021 08:37:18 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-txIt4ek0LG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

Kay Jeschonneck <kay.jeschonneck@airbus.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #9 from Kay Jeschonneck <kay.jeschonneck@airbus.com> ---
I have found the problem.
In the logs of the command "make dhcp-dirclean dhcp" i get the info the package
gawk is missed. After i install this package, everything is fine.

Thanks for your help.

I close this bug report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
