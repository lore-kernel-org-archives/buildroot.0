From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 16:28:17 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608162817.6FF3C9CB00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #6 from Mike Z <minimod@morethan.org> 2014-06-08 16:28:17 UTC ---
(In reply to comment #5)
> Is what you wrote here correct? (No copy paste error?) Case one and two are
> identical?
> Have you tried four dollar signs? Depending on how things are parsed it may be
> needed...
>

Yup - not what I expected either.*

Will recheck for cockpit error here and the $$$$ case.

Mike
* I have noticed that menuconfig does not always detect (and save) a
configuration
change that only involves editing a string field.
I'll "less .config" before each test next time.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
