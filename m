From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 13:29:25 +0000
Subject: [Buildroot] [Bug 11071] Building postgresql package on Debian 9.4
 x64 for armel target fails
In-Reply-To: <bug-11071-163@https.bugs.busybox.net/>
References: <bug-11071-163@https.bugs.busybox.net/>
Message-ID: <bug-11071-163-zo4f6Ou16W@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

--- Comment #7 from dde at innovaphone.com ---
(In reply to Thomas Petazzoni from comment #5)

Thanks for your reply! This solved the issue. I wouldn't have guessed something
like this, but I'm not really familiar to buildroot backgrounds ;)

I attached a patch with the changes of package/postgresql.mk and this patch
adds --with-libxml just if libxml is enabled. 
I hope this is ok like this ...

Greetings,
Daniel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
