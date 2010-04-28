From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Apr 2010 18:14:21 +0000 (UTC)
Subject: [Buildroot] [Bug 1645] New: Bump hostapd package to 0.7.2
Message-ID: <bug-1645-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1645

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: Bump hostapd package to 0.7.2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1585)
 --> (https://bugs.busybox.net/attachment.cgi?id=1585)
Bump hostapd to 0.7.2

Bump hostapd package to version 0.7.2 since it works better with newer
(2.6.32+) kernels.
Latest stable (0.6.10) doesn't play nicely with ath5k hardware which is pretty
common in the form of minipci cards.
Also forcibly enabled the NL80211 driver since it's mostly pointless to use it
without it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
