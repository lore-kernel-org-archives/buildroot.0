From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 May 2016 19:02:28 +0000
Subject: [Buildroot] [Bug 8936] Aircrack-ng - Alot of missing dependencies
In-Reply-To: <bug-8936-163@https.bugs.busybox.net/>
References: <bug-8936-163@https.bugs.busybox.net/>
Message-ID: <bug-8936-163-ZGqJzIGKSJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8936

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
aircrack-ng is a toolbox with several tools. Not all of them require iw,
iwconfig, etc. It is possible that some users only require the tools that don't
use these.

That said, it would make sense to mention that explicitly in the help text.
I'll submit a patch doing exactly that.

But I'm marking this bug as WONTFIX because we will not select ethtools, iw,
etc.

If you disagree, feel free to reopen.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
