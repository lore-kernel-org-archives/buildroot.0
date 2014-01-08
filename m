From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Jan 2014 16:47:05 +0000 (UTC)
Subject: [Buildroot] [Bug 6770] openssl bump
In-Reply-To: <bug-6770-163@https.bugs.busybox.net/>
References: <bug-6770-163@https.bugs.busybox.net/>
Message-ID: <20140108164705.63A429C3EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6770

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-01-08 16:47:05 UTC ---
Tried a simple i386/i586 sourcery 2012.09 + ARM A9 EABI linaro 2013.11 target
with openssl + wpa_supplicant + netsnmp enabled without issues.
And i'm not seeing any failure in the autobuilders either.
And i've personally built for uClibc toolchains with e300c3 & e500v2 targets
without issues either (which include netsnmp, wpa_supplicant and other packages
that use openssl).
So i can't get a failure scenario.
Sure there's nothing else going on? (specially since you're using your own
toolchains) and the problem lies somewhere else?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
