From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Jun 2015 14:21:28 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] alsa-lib headers problem that prevents to
 compile alsa dependent projects
In-Reply-To: <bug-8036-163@https.bugs.busybox.net/>
References: <bug-8036-163@https.bugs.busybox.net/>
Message-ID: <20150605142128.AF2178077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-05 14:21:28 UTC ---
The Buildroot configuration you provided builds just fine (I've only disabled
the kernel, but it's irrelevant to the alsa-utils problem). And you also say
that you managed to build alsa-utils successfully.

So: what is the bug ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
