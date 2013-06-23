From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Jun 2013 01:57:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6326] Dropbear: Add options to allow better config
 for different target devices (e.g. routers)
In-Reply-To: <bug-6326-163@https.bugs.busybox.net/>
References: <bug-6326-163@https.bugs.busybox.net/>
Message-ID: <20130623015741.9727F9B15F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6326

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-06-23 01:55:54 UTC ---
Which "multiple embedded device targets" are you talking about?
If you can't put files where you want/they belong sounds like you want to use
buildroot to extend some sort of closed firmware or target - hacky targets
aren't the goal of this project.
Option overloading is not something we want and this patch pretty much looks
like it.
You can achive your goal by using something as simple as the global patch dir,
that way you can just modify dropbear's options.h directly.

Closing as WONTFIX unless you can give a really good reason why this patch is
necessary and you can't use the global patch dir.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
