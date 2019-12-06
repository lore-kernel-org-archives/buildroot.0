From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Dec 2019 21:50:26 +0000
Subject: [Buildroot] [Bug 12386] carriage return issue when "make menuconfig"
In-Reply-To: <bug-12386-163@https.bugs.busybox.net/>
References: <bug-12386-163@https.bugs.busybox.net/>
Message-ID: <bug-12386-163-y4qOe3FsJx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12386

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Hello Daniel,

would suspect something with your (local) git configuration options,
check the output from:

$ git config --global core.autocrlf

Or try as quick workaround a buildroot release download (avoiding git) from
https://buildroot.org/download.html

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
