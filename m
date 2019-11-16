From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Nov 2019 09:11:32 +0000
Subject: [Buildroot] [Bug 12316] tzdata fails to install with empty "default
 local time"
In-Reply-To: <bug-12316-163@https.bugs.busybox.net/>
References: <bug-12316-163@https.bugs.busybox.net/>
Message-ID: <bug-12316-163-0yO0NmBAVg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12316

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Andrew,
Thanks for the report.

I just sent a patch that I believe handles this case:
    https://patchwork.ozlabs.org/patch/1196072/

Care to test that, and report, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
