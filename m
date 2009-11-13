From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Nov 2009 15:29:36 +0000 (UTC)
Subject: [Buildroot] [Bug 717] New: Bump dnsmasq to 2.51 and introduce new
	IDN option
Message-ID: <bug-717-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=717

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump dnsmasq to 2.51 and introduce new IDN option
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
        Depends on: 715
   Estimated Hours: 0.0


Created an attachment (id=749)
 --> (https://bugs.busybox.net/attachment.cgi?id=749)
Bump dnsmasq package to 2.51

Dnsmasq 2.51 introduces IDN support, add it to the package.
Newsworthy items:

* Add support for internationalised DNS (IDN).
* Improved upstream nameserver checks for slow nameservers.
* Improved TFTP support (win/dos filenames, new tftpserver-address option for
DHCP).

Tested against improved libidn package from #715 so adding it as a depend, it
may be unnecessary though.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
