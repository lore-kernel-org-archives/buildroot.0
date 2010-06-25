From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 10:57:43 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100625105743.5F44381DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

--- Comment #7 from Matthias Brugger <mensch0815@gmail.com>  ---
Hello Thomas,

right now I get a different error, maybe it's because I use 2010.05.
But after all I think there is a problem, when you build an external toolchain
with one buildroot and then try to build another buildroot with this toolchain.
In my case I build the atngw100 with toolchain dir to /home/matthias/toolchain.
Afterwards I took another buildroot (with same version) and tried to build
antgw100 but stating that the external toolchain is at
/home/matthias/toolchain.

Check this, I'm sure you will find some bugs.
Hope that helped a bit.

Regards,
Matthias

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
