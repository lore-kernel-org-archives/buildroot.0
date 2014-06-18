From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 18 Jun 2014 20:21:58 +0400
Subject: [Buildroot] [PATCH 0/2] strace: fix ptrace {PEEK,
	POKE}USER arguments decoding on xtensa
Message-ID: <1403108520-26869-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series adds serial numbers to existing strace patches and backports
an xtensa-specific fix for {PEEK,POKE}USER register number decoding.


Max Filippov (2):
  strace: add serial number to existing patch file names
  strace: fix ptrace {PEEK,POKE}USER arguments decoding on xtensa

 ...trace-01-fix-disabled-largefile-syscalls.patch} |  0
 ...=> strace-02-fix-ptrace_peeksiginfo_args.patch} |  0
 ...gure.patch => strace-03-update-configure.patch} |  0
 ...xtensa-sort-values-in-struct_user_offsets.patch | 76 ++++++++++++++++++++++
 4 files changed, 76 insertions(+)
 rename package/strace/{strace-fix-disabled-largefile-syscalls.patch => strace-01-fix-disabled-largefile-syscalls.patch} (100%)
 rename package/strace/{strace-fix-ptrace_peeksiginfo_args.patch => strace-02-fix-ptrace_peeksiginfo_args.patch} (100%)
 rename package/strace/{strace-update-configure.patch => strace-03-update-configure.patch} (100%)
 create mode 100644 package/strace/strace-04-xtensa-sort-values-in-struct_user_offsets.patch

-- 
1.8.1.4
