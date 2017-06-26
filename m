From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jun 2017 11:07:37 +0000
Subject: [Buildroot] [Bug 9966] util-linux-2.30/.stamp_built' failed
In-Reply-To: <bug-9966-163@https.bugs.busybox.net/>
References: <bug-9966-163@https.bugs.busybox.net/>
Message-ID: <bug-9966-163-2tGguRjbNw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

Carlos Santos <casantos@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Carlos Santos <casantos@datacom.ind.br> ---
Please check if the problem persists on a recent master snapshot (as of commit
74235a6854d6e469f2dbc141fe08ce9ae94e7d3c).

Please provide a copy of your defconfig. Run

    $ make savedefconfig BR2_DEFCONFIG=/tmp/bug_9966_defconfig

Then attach /tmp/bug_9966_defconfig to this bug report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
