From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Dec 2019 23:53:43 +0000
Subject: [Buildroot] [Bug 12386] carriage return issue when "make menuconfig"
In-Reply-To: <bug-12386-163@https.bugs.busybox.net/>
References: <bug-12386-163@https.bugs.busybox.net/>
Message-ID: <bug-12386-163-hwnlyfL3vz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12386

Daniel Li <lida_mail@163.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #3 from Daniel Li <lida_mail@163.com> ---
with following commands

$ git config --global core.autocrlf

it turns true.

I reconfig to input, it works.


Thanks for the instructions.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
