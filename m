From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  3 May 2009 15:42:37 +0000 (UTC)
Subject: [Buildroot] [Bug 311] New: util-linux-pre7 complains swapon has 1
	args
Message-ID: <bug-311-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=311

              Host: Slackware Linux 12.1 - x86
            Target: Generic x86 firewall
           Summary: util-linux-pre7 complains swapon has 1 args
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at polaco.pro.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=289)
 --> (https://bugs.busybox.net/attachment.cgi?id=289)
Fix the wrong argument count for swapon

I had to patch util-linux in order to compile, on the last SVN version of
buildroot (v2009.05-svn)

when compiling, it reports that libc has only 1 arg to swapon function, but 
in fact it requires 2.

I Included a patch to fix that.

thanks.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
