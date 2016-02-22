From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Feb 2016 12:20:52 +0000
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link reference
 in buildroot image
In-Reply-To: <bug-8651-163@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
Message-ID: <bug-8651-163-kgMh1g40Dt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

Markus Egle <Markus.Egle@Qiagen.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #10 from Markus Egle <Markus.Egle@Qiagen.com> ---
Fixed.

Applied patch with copying to buildroot/package/mono
After 
> make clean
> make

buildroot/output/target/etc/mono/config shows the correct path for
libMonoPosixHelper.so without any prefix and accordingly bzImage works as
expected. 

Thanks
Markus

-- 
You are receiving this mail because:
You are on the CC list for the bug.
