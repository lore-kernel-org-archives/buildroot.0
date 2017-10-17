From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 22:41:41 +0200
Subject: [Buildroot] [PATCH] package/gcc: bump to 5.5.0
In-Reply-To: <20171015215736.3573-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 15 Oct 2017 23:57:35 +0200")
References: <20171015215736.3573-1-romain.naour@gmail.com>
Message-ID: <87zi8pfqwq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Remove xtensa patches included in this release:
 > 872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 > 873-xtensa-fix-_Unwind_GetCFA.patch
 > 876-xtensa-Fix-PR-target-78603.patch
 > 877-xtensa-fix-PR-target-82181.patch

 > Remove upstream patch:
 > 942-asan-fix-missing-include-signal-h.patch

 > Remove backported patches for glibc >= 2.26
 > 943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 > 944-sanitizer-linux.patch

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
