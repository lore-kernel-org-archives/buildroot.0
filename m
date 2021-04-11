From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Apr 2021 21:50:16 +0000
Subject: [Buildroot] [Bug 13721] c-stack.c:55:26: error: missing binary
 operator before token "("
In-Reply-To: <bug-13721-163@https.bugs.busybox.net/>
References: <bug-13721-163@https.bugs.busybox.net/>
Message-ID: <bug-13721-163-nJvPcBmQdg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13721

--- Comment #5 from stsp <stsp2@yandex.ru> ---
Created attachment 8896
  --> https://bugs.busybox.net/attachment.cgi?id=8896&action=edit
The patch that I googled

Hi.

Your patch doesn't work as-is
(or at least I don't know how),
but after I extracted
0003-c-stack-stop-using-SIGSTKSZ.patch
out of it, it worked.
Your original patch only creates
another patch file, maybe that's
on purpose, I just don't know how
to utilize it in that form.

In any case, I already googled out
another patch, which I now attach
here.
Pleas let me know which one is
"better".

-- 
You are receiving this mail because:
You are on the CC list for the bug.
