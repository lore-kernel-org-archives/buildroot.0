From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Sep 2019 07:58:41 +0000
Subject: [Buildroot] [Bug 12181] dropbear: norootlogin (-w) no longer works
 when PAM is enabled
In-Reply-To: <bug-12181-163@https.bugs.busybox.net/>
References: <bug-12181-163@https.bugs.busybox.net/>
Message-ID: <bug-12181-163-bhPFklXW9t@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12181

--- Comment #3 from Jan Dumon <jan.dumon@septentrio.com> ---
(In reply to Peter Korsgaard from comment #2)
> Presumably this is fixed by the 2nd patch. Can you try applying this patch to
> the 2019.02.x version and test:

Tried it and it works, no more root logins with -w.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
