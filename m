From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Oct 2020 08:58:54 +0000
Subject: [Buildroot] [Bug 13241] CMake miss linking with pthread library
In-Reply-To: <bug-13241-163@https.bugs.busybox.net/>
References: <bug-13241-163@https.bugs.busybox.net/>
Message-ID: <bug-13241-163-FaGA13Ir5f@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13241

--- Comment #2 from Leonid Yuriev <leo@yuriev.ru> ---
Created attachment 8601
  --> https://bugs.busybox.net/attachment.cgi?id=8601&action=edit
patch with libmdbx package as a testcase

Basically this is identical to patch with libmdbx-package submission,
but WITHOUT workaround for https://bugs.busybox.net/show_bug.cgi?id=13241

So it could be used as a testcase.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
