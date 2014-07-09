From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Jul 2014 11:26:38 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue on a
 Debian/Ubuntu host with multiarch support
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140709112638.41DF59D1E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

--- Comment #15 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-09 11:26:37 UTC ---
(In reply to comment #14)
> Hi Thomas,
> 
> I managed to compile python 2.7 and python 3 using your patches.
> 
> Please forgive me, I'm not familiar with the "Tested-by" thing... How would you
> do that ?

You would have had to reply to the patches sent to the mailing list, and just
add a line like:

Tested-by: John Doe <john.doe@foobar.org>

In the reply.

However, the patches have been committed now, so it's too late :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
