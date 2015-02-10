From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Feb 2015 14:07:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure: missing
 dependency ExtUtils/MakeMaker
In-Reply-To: <bug-7772-163@https.bugs.busybox.net/>
References: <bug-7772-163@https.bugs.busybox.net/>
Message-ID: <20150210140733.975DE80E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

--- Comment #1 from saiberion at web.de 2015-02-10 14:07:31 UTC ---
Created attachment 5858
  --> https://bugs.busybox.net/attachment.cgi?id=5858
Add dependency check for ExtUtils::MakeMaker

I also had this problem and fixed it by reinstalling ExtUtils module on my
host.
The attached patch adds a check for this module.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
