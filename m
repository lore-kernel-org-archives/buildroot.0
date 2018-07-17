From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Jul 2018 11:18:51 +0000
Subject: [Buildroot] [Bug 11156] In python3 module 'socket' has no attribute
 'AF_BLUETOOTH'
In-Reply-To: <bug-11156-163@https.bugs.busybox.net/>
References: <bug-11156-163@https.bugs.busybox.net/>
Message-ID: <bug-11156-163-wL0SrdYiX6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11156

--- Comment #1 from Grzegorz Blach <grzegorz@blach.pl> ---
Created attachment 7666
  --> https://bugs.busybox.net/attachment.cgi?id=7666&action=edit
Support for socket.AF_BLUETOOTH

Ok, I found a solution, but unfortunately my patch makes a circular
dependencies, so I must disable libmount Python bindings.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
