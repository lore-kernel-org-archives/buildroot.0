From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Apr 2013 16:56:09 +0000 (UTC)
Subject: [Buildroot] [Bug 6164] openvpn usage of ip tool from Busybox
In-Reply-To: <bug-6164-163@https.bugs.busybox.net/>
References: <bug-6164-163@https.bugs.busybox.net/>
Message-ID: <20130404165609.C3E829B4B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6164

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |gustavo at zacarias.com.ar

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-04-04 16:56:53 UTC ---
*SIGH*
Actually your modification isn't 100% correct.
Busybox <1.21.x places ip in /bin, >=1.21.x places it in /sbin (like the
iproute2 package).
So some additional logic is needed.
I've just sent a patch to the list to address this, try
http://patchwork.ozlabs.org/patch/233877/

Thanks for the headsup!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
