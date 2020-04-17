From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Apr 2020 23:34:07 +0000
Subject: [Buildroot] [Bug 12751] OpenJdk package installation issues on
 target
In-Reply-To: <bug-12751-163@https.bugs.busybox.net/>
References: <bug-12751-163@https.bugs.busybox.net/>
Message-ID: <bug-12751-163-PUBYP7DDEV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12751

--- Comment #3 from Adam Duskett <aduskett@gmail.com> ---
(In reply to Ameya from comment #1)

Hello Ameya;

I have created a patch series that should fix your issues.
In addition, I also submitted a patch that will allow building and installing
the full JDK.

If you would be so kind as to test the patches and possibly provide a
"Tested-By" comment if they work for you, I would very much appreciate it.

Fixes for 2020.02.x:
https://patchwork.ozlabs.org/project/buildroot/list/?series=171015

Fixes and JDK support for master:
https://patchwork.ozlabs.org/project/buildroot/list/?series=171014

Thanks!

Adam

-- 
You are receiving this mail because:
You are on the CC list for the bug.
