From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 Aug 2015 19:52:33 +0000 (UTC)
Subject: [Buildroot] [Bug 8321] New: invalid opcode error with minidlna and
	ffmpeg
Message-ID: <bug-8321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8321

           Summary: invalid opcode error with minidlna and ffmpeg
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ramesh at rr7.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Have a strange issue... I keep getting invalid opcode errors when minidlna is
scanning my files. The scanner then stops. I get these sort of errors in
dmesg...

traps: minidlnad[2435] trap invalid opcode ip:7fb52ca30120 sp:7fff7745e1a8
error:0 in libavutil.so.54.20.100[7fb52ca1b000+4c000]

Running 2015.05 with ffmpeg 2.6.2 and minidlna 1.1.4

ffmpeg version up to 2.5.8 work fine. Everything from 2.6.1 onwards causes
various versions of the above error. I cannot seem to debug it - any help is
very welcome. Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
