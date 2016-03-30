From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Mar 2016 15:44:28 +0000
Subject: [Buildroot] [Bug 8836] Can't select Vim in menuconfig
In-Reply-To: <bug-8836-163@https.bugs.busybox.net/>
References: <bug-8836-163@https.bugs.busybox.net/>
Message-ID: <bug-8836-163-n7t8bGHTe6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8836

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
vim is by default hidden behind the option BR2_PACKAGE_BUSYBOX_SHOW_OTHERS,
because there is already a minimal implementation of vi in Busybox. So you
should enable BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and then you will be able to
enable vim.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
