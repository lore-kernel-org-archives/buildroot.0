From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:16:31 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure: missing
 dependency ExtUtils/MakeMaker
In-Reply-To: <bug-7772-163@https.bugs.busybox.net/>
References: <bug-7772-163@https.bugs.busybox.net/>
Message-ID: <20150730101631.1C81C81E8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

--- Comment #5 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-07-30 10:16:31 UTC ---
(In reply to comment #4)
> Vicente, do you have a readily available chroot in which we can run Buildroot
> to reproduce this problem?

No, I don't. But you can just remove perl-MakeMaker from your host machine and
try to build Buildroot using a defconfig which includes libxml-parser-perl.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
