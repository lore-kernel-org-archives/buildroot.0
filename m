From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jul 2020 17:59:31 +0000
Subject: [Buildroot] [Bug 13101] BR audit2allow support
In-Reply-To: <bug-13101-163@https.bugs.busybox.net/>
References: <bug-13101-163@https.bugs.busybox.net/>
Message-ID: <bug-13101-163-jX12FDiFUj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13101

Tomas V Arredondo <surf_fanatico@yahoo.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Tomas V Arredondo <surf_fanatico@yahoo.com> ---
Solved as of 5.4.53

audit2allow < /var/log/messages
#============= kernel_t ==============

#!!!! This avc can be allowed using one of the these booleans:

allow_execstack, allow_execmem
allow kernel_t self:process execmem;
uname -r
5.4.53

-- 
You are receiving this mail because:
You are on the CC list for the bug.
