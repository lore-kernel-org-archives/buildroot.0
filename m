From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Dec 2018 18:01:32 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-ps74L0EdzE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #12 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Peter Seiderer from comment #11)

From your build failure log:

make[3]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/compositor'

...disable the BR2_PACKAGE_QT5WAYLAND_COMPOSITOR option and try again (this
time
after make qt5wayland-dirclean), no need for the qt5wayland compositor, you
have
already weston enabled)...

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
