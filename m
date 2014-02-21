From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Feb 2014 14:34:49 +0000 (UTC)
Subject: [Buildroot] [Bug 5774] Not able to build ALSA-Utils for static build
In-Reply-To: <bug-5774-163@https.bugs.busybox.net/>
References: <bug-5774-163@https.bugs.busybox.net/>
Message-ID: <20140221143449.508C69CB09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5774

--- Comment #2 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2014-02-21 14:34:49 UTC ---
(In reply to comment #1)
> In any case, the patch attached to this bug report is not ok: it would remove
> -ldl unconditionally, even if shared libraries were requested.

Hi Thomas,

even if you remove -ldl from configure it will still failing. I have tried it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
