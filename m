From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Apr 2016 21:26:58 +0000
Subject: [Buildroot] [Bug 8766] Compiling host-gcc-final-4.9.3 broken on i386
In-Reply-To: <bug-8766-163@https.bugs.busybox.net/>
References: <bug-8766-163@https.bugs.busybox.net/>
Message-ID: <bug-8766-163-Iv6DVNJfQr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
i386 support has been deprecated as of
https://git.buildroot.net/buildroot/commit/?id=6cb4814c87cb1282b4a1d35e73743e8dd1b12ec5.

x86 non-threaded configuration has been fixed as of
https://git.buildroot.net/buildroot/commit/?id=2631219f648f4aa13fa36d06a483e4507cb6f3d7.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
