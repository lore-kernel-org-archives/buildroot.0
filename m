From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Nov 2009 20:36:36 +0000 (UTC)
Subject: [Buildroot] [Bug 543] ATK requires X11 on DirectFB target
In-Reply-To: <bug-543-163@https.bugs.busybox.net/>
References: <bug-543-163@https.bugs.busybox.net/>
Message-ID: <20091122203636.B3D59777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=543





--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-22 20:36:35 UTC ---
(In reply to comment #5)
> Created an attachment (id=623)
 --> (https://bugs.busybox.net/attachment.cgi?id=623) [details]
> Config file
> 
> Things are wrong, just in general.

I don't really see anything wrong in that config. I see that you're building
for x86 - My guess is that some package ends up using atk headers/lib from the
host. Do you have the atk development package installed on your host?

Could you provide a bit more details about what goes wrong - What error message
do you get exactly? 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
