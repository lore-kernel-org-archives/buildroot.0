From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:16:38 +0000 (UTC)
Subject: [Buildroot] [Bug 3601] DHCPD S80dhcp-server startup script issues
In-Reply-To: <bug-3601-163@https.bugs.busybox.net/>
References: <bug-3601-163@https.bugs.busybox.net/>
Message-ID: <20131114001638.621869BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3601

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:16:38 UTC ---
I think point (1) is intentional: make sure the script doesn't do anything
until there is a proper configuration.

(2) is expected: all the init scripts in Buildroot work like this.

(3) is really cosmetic I believe.

Gustavo, what do you think? Can you have a look at the remaining issues, if
any, and make a final call about this bug?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
