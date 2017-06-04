From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Jun 2017 09:28:37 +0000
Subject: [Buildroot] [Bug 9906] genimage: Disk full
In-Reply-To: <bug-9906-163@https.bugs.busybox.net/>
References: <bug-9906-163@https.bugs.busybox.net/>
Message-ID: <bug-9906-163-P0Pl8m4Hfz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9906

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> Would it make sense to be able to configure the bootfs size via make
> nconfig[...]?

No, it does not make sense.

Remember that our defconfigs are just basic samples to have a board
boot up to a shell. If your use-case diverges from the sample, it is
your responsibility to adapt it.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
