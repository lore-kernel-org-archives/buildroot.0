From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jun 2017 11:03:02 +0000
Subject: [Buildroot] [Bug 9966] util-linux-2.30/.stamp_built' failed
In-Reply-To: <bug-9966-163@https.bugs.busybox.net/>
References: <bug-9966-163@https.bugs.busybox.net/>
Message-ID: <bug-9966-163-Vhjpx9CQI1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

Carlos Santos <casantos@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Carlos Santos <casantos@datacom.ind.br> ---
Looks like the reporter attempted to perform a dirty build in an output
directory containing traces of a previous build, for a different architecture.

Closing as RESOLVED/WORKSFORME, since the reporter did not provide enough
information to reproduce the failure and was able to circumvent the problem by
means of a clean build.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
