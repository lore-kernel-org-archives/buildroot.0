From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 18 Jun 2014 20:21:59 +0400
Subject: [Buildroot] [PATCH 1/2] strace: add serial number to existing patch
	file names
In-Reply-To: <1403108520-26869-1-git-send-email-jcmvbkbc@gmail.com>
References: <1403108520-26869-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1403108520-26869-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...ile-syscalls.patch => strace-01-fix-disabled-largefile-syscalls.patch} | 0
 ...peeksiginfo_args.patch => strace-02-fix-ptrace_peeksiginfo_args.patch} | 0
 .../{strace-update-configure.patch => strace-03-update-configure.patch}   | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/strace/{strace-fix-disabled-largefile-syscalls.patch => strace-01-fix-disabled-largefile-syscalls.patch} (100%)
 rename package/strace/{strace-fix-ptrace_peeksiginfo_args.patch => strace-02-fix-ptrace_peeksiginfo_args.patch} (100%)
 rename package/strace/{strace-update-configure.patch => strace-03-update-configure.patch} (100%)

diff --git a/package/strace/strace-fix-disabled-largefile-syscalls.patch b/package/strace/strace-01-fix-disabled-largefile-syscalls.patch
similarity index 100%
rename from package/strace/strace-fix-disabled-largefile-syscalls.patch
rename to package/strace/strace-01-fix-disabled-largefile-syscalls.patch
diff --git a/package/strace/strace-fix-ptrace_peeksiginfo_args.patch b/package/strace/strace-02-fix-ptrace_peeksiginfo_args.patch
similarity index 100%
rename from package/strace/strace-fix-ptrace_peeksiginfo_args.patch
rename to package/strace/strace-02-fix-ptrace_peeksiginfo_args.patch
diff --git a/package/strace/strace-update-configure.patch b/package/strace/strace-03-update-configure.patch
similarity index 100%
rename from package/strace/strace-update-configure.patch
rename to package/strace/strace-03-update-configure.patch
-- 
1.8.1.4
