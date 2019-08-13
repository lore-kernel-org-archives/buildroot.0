From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Aug 2019 01:17:32 +0000
Subject: [Buildroot] [Bug 11706] binman (U-boot tool) cannot find libfdt
 "binman: No module named _libfdt" if python3 selected
In-Reply-To: <bug-11706-163@https.bugs.busybox.net/>
References: <bug-11706-163@https.bugs.busybox.net/>
Message-ID: <bug-11706-163-VaBsvasSTr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11706

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #1 from Carlos Santos <unixmania@gmail.com> ---
Sorry for the late answer. I'm taking this bug.

Is this report still valid? If yes, please attach a copy your defconfig. You
can create it with:

   $ make sevedefconfig BR2_DEFCONFIG=/tmp/defconfig

Then attach the generated /tmp/defconfig to this case.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
