From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 21:16:57 +0000
Subject: [Buildroot] [Bug 9906] genimage: Disk full
In-Reply-To: <bug-9906-163@https.bugs.busybox.net/>
References: <bug-9906-163@https.bugs.busybox.net/>
Message-ID: <bug-9906-163-jl90vC8k1f@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9906

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|ASSIGNED                    |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Alexander, Peter, All,

> I just did a test build with 2017.05-rc3 here and raspberrypi3_64_defconfig,
> and I end up with ~15 MB used in the fat partition[...]

Ditto.

> If you change the configuration significantly then it isn't surprising
> that you may need to tweak other things, so this IMHO isn't a bug.

Agreed.

I'm closing this report. If you still have the issue with a stock
Buildroot rpi3_64 defconfig, please re-open.

Thanks! :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
