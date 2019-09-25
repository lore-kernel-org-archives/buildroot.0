From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Sep 2019 20:09:58 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-cMgz5sgrSn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=6136765b23abd9faba610dd54ed276a777811575.
Thanks Carlos for the investigation and fix!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
