From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Aug 2014 16:27:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7328] Git dl of versions in x/y broken
In-Reply-To: <bug-7328-163@https.bugs.busybox.net/>
References: <bug-7328-163@https.bugs.busybox.net/>
Message-ID: <20140819162716.709139D4A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7328

--- Comment #2 from Vincent Stehl? <vincent.stehle@freescale.com> 2014-08-19 16:27:16 UTC ---
(In reply to comment #1)
> Please be more specific: what do you mean with 'in x/y' ?

In my case I set <PKG>_VERSION in a .mk to my development branch:

  FOO_VERSION = vincent/dev

> Please give an example and/or a reproduction scenario.

I'll try to devise a quick test case with a public git tree to demonstrate.

V.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
