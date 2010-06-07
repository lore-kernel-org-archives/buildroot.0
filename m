From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 20:21:26 +0000 (UTC)
Subject: [Buildroot] [Bug 1879] Bump iptables to 1.4.8
In-Reply-To: <bug-1879-163@https.bugs.busybox.net/>
References: <bug-1879-163@https.bugs.busybox.net/>
Message-ID: <20100607202126.7807C8B8BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1879

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Ooops this bit slided through my claws... iptables now needs host-pkg-config
when checking for libnfnetlink... please apply the patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
