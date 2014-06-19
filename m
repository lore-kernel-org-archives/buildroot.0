From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jun 2014 17:58:44 +0200
Subject: [Buildroot] [git commit] strace: add serial number to existing
	patch file names
Message-ID: <20140619155933.7E9869D045@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94c5ae72034a86b109bb9c2a648b5f24fe295de2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...trace-01-fix-disabled-largefile-syscalls.patch} |    0
 ...=> strace-02-fix-ptrace_peeksiginfo_args.patch} |    0
 ...gure.patch => strace-03-update-configure.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

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
