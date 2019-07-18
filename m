From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Jul 2019 20:34:14 +0000
Subject: [Buildroot] [Bug 12031] Build of cups-filters fails while linking,
 apparently due to missing libiconv
In-Reply-To: <bug-12031-163@https.bugs.busybox.net/>
References: <bug-12031-163@https.bugs.busybox.net/>
Message-ID: <bug-12031-163-9UcjN3Frxf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12031

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |

--- Comment #2 from Carlos Santos <unixmania@gmail.com> ---
Please run the following commands

    $ make savedefconfig BR2_DEFCONFIG=/tmp/bz12031.defconfig
    $ gzip /tmp/bz12031.defconfig

Then attach the resulting /tmp/bz12046.defconfig.gz file to this bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
