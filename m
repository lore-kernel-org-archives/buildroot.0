From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Jul 2019 18:56:51 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_12046=5D_Can=E2=80=99t_login_as_roo?=
 =?utf-8?q?t_user_after_upgrading_to_buildroot_2019=2E02?=
In-Reply-To: <bug-12046-163@https.bugs.busybox.net/>
References: <bug-12046-163@https.bugs.busybox.net/>
Message-ID: <bug-12046-163-tm65tAWHT2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12046

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |

--- Comment #1 from Carlos Santos <unixmania@gmail.com> ---
Please run the following commands

    $ make savedefconfig BR2_DEFCONFIG=/tmp/bz12046.defconfig
    $ gzip /tmp/bz12046.defconfig

Then attach the resulting /tmp/bz12046.defconfig.gz file to this bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
