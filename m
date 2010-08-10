From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Aug 2010 17:25:43 +0000 (UTC)
Subject: [Buildroot] [Bug 635] util-linux fails to build in 2009.08
In-Reply-To: <bug-635-163@https.bugs.busybox.net/>
References: <bug-635-163@https.bugs.busybox.net/>
Message-ID: <20100810172543.D537C87390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I have added a fix for the util-linux build failure on MIPS reported in this
bug to my for-2010.08 branch. See
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.08&id=55f70939b839cd5ad826ea01fcb6d363d63ee15d.

This branch will be pushed to Peter before the 2010.08 release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
