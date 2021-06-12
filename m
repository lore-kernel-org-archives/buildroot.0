From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 12 Jun 2021 22:38:17 +0000
Subject: [Buildroot] [Bug 13831] mesa3d - kmsro driver requires dri3
In-Reply-To: <bug-13831-163@https.bugs.busybox.net/>
References: <bug-13831-163@https.bugs.busybox.net/>
Message-ID: <bug-13831-163-Ru5dt3tB8D@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13831

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
Patches suggested:

- [v1,1/2] package/mesa3d: add config option for DRI3 support:
 
https://patchwork.ozlabs.org/project/buildroot/patch/20210612223011.26118-1-ps.report at gmx.net/

- [v1,2/2] package/mesa3d: gallium/kmsro drivers require dri3 for X11
 
https://patchwork.ozlabs.org/project/buildroot/patch/20210612223011.26118-2-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
