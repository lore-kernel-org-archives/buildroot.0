From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Dec 2018 22:38:44 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-tWfajO9SUT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #9 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Patrick Koller from comment #6)

Still the same advice:

> Second test was without qt, only wayland/weston, did not compile out of the
> box, a quick fix was to upgrade to a buildroot toolchain instead of the given
> gcc-linaro-4.9.4 toolchain (did not investigate further).

Did run my successful build with buildroot gcc-7.4.0 toolchain...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
