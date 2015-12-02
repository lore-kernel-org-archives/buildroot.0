From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 22:01:10 +0000
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <bug-8296-163-0iornWx5Tn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #7 from Arnout Vandecappelle <arnout@mind.be> ---
Preferably make two patches for upstream: one that fixes the SEGV in
node::os::GetInterfaceAddresses by adding the missing return (that's a patch we
don't really need in buildroot), and one patch that adds support for uClibc-ng.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
