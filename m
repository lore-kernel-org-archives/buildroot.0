From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 07:09:17 +0000 (UTC)
Subject: [Buildroot] [Bug 507] New: Enable live and tv options in
	MPlayer-1.0rc2
Message-ID: <bug-507-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=507

           Summary: Enable live and tv options in MPlayer-1.0rc2
           Product: buildroot
           Version: unspecified
          Platform: All
               URL: http://lists.mplayerhq.hu/pipermail/mplayer-users/2007-
                    April/066873.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=519)
 --> (https://bugs.busybox.net/attachment.cgi?id=519)
Enable live and tv options in MPlayer-1.0rc2

We could remove '--disable-live' and '--disable-tv'
in MPlayer-1.0rc2.

It will autodetect whether live555 was installed
to default path /usr/lib or /usr/local/lib.
And the option '--with-extraincdir' also could be
used to specify install path of live555.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
