From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Oct 2016 20:38:02 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-ybozmUzykI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by the following commits:

b63951da35f56a2c606b9383e6e39bfd61e92b34 package/xdriver_xf86-input-synaptics:
fix install paths
3065189a0a64cd3382a67115b2119d773e02e697 package/xdriver_xf86-input-mouse: fix
install paths
b8bd2bea3b1ce2cdb0c510e2aee889ae9b3f2c92 package/xdriver_xf86-input-libinput:
fix install paths
e07338fa99f7807fafd32dc6b811d313bd14327b package/xdriver_xf86-input-joystick:
fix install paths
df8534455472b4257d57b88162a8fb8402fc50ff package/xdriver_xf86-input-evdev: fix
install paths

Thanks Yann for providing those patches!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
