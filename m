From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 12:38:36 +0000
Subject: [Buildroot] [Bug 9876] aarch64 support with gcc 4.8 toolchain
In-Reply-To: <bug-9876-163@https.bugs.busybox.net/>
References: <bug-9876-163@https.bugs.busybox.net/>
Message-ID: <bug-9876-163-4dnZ2D4K2d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9876

--- Comment #2 from Jean-pierre Cartal <jpcartal@free.fr> ---
Hi,

Thanks for your help.

Unfortunately we don't have much choice regarding the toolchain version as it
is currently provided by a 3rd party. We might try to use buildroot toolchain
since that would indeed solve our issue. Thanks for the tip on where to remove
the lp64 option.

As a side note, wouldn't it make sense to disable aarch64 compilation with
external gcc  toolchains older than 4.9.x since it will not work ?

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
