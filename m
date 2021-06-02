From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Jun 2021 20:21:42 +0000
Subject: [Buildroot] [Bug 13816] xstart failed since update the x11 libraries
In-Reply-To: <bug-13816-163@https.bugs.busybox.net/>
References: <bug-13816-163@https.bugs.busybox.net/>
Message-ID: <bug-13816-163-YHSU7EVK8q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13816

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Same/similar failure was reported on the buildroot mailing list
'[Buildroot] [RPi4] Enable GTK3 on Buildroot' (see [1]) providing
an buildroot config file to reproduce the failure.

Should be fixed with suggested buildroot patch, see [2].

[1] http://lists.busybox.net/pipermail/buildroot/2021-June/311763.html
[2]
https://patchwork.ozlabs.org/project/buildroot/patch/20210602201529.6210-1-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
