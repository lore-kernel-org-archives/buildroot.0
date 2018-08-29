From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Aug 2018 23:05:21 +0000
Subject: [Buildroot] [Bug 11261] ccache using wrong cached objects
In-Reply-To: <bug-11261-163@https.bugs.busybox.net/>
References: <bug-11261-163@https.bugs.busybox.net/>
Message-ID: <bug-11261-163-WVHSnpi7q5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11261

--- Comment #2 from David De Grave <david.degrave@mind.be> ---
(In reply to Thomas Petazzoni from comment #1)
Hi Thomas, no, I discovered a problem while building the linux kernel and
finally found with the help of Arnout from where came the problem. It's
something with ccache and the way buildroot deal with it.

So, he asked me to fill an empty bugzilla report for him to remember (I guess).
He will fills all the details himself later... Sorry.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
