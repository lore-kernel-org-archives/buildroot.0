From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 11:56:32 +0200
Subject: [Buildroot] [PATCH 7/7] toolchain: bump 2.6.35 kernel headers
	to 2.6.35.12
In-Reply-To: <1303321319-16553-7-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 20 Apr 2011 14:41:59 -0300")
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
	<1303321319-16553-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87liz4ylkf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  toolchain/kernel-headers/Config.in                 |    2 +-
 Gustavo>  ...-types-for-headers-exported-to-user-space.patch |   59 --------------------
 Gustavo>  ...-types-for-headers-exported-to-user-space.patch |   59 ++++++++++++++++++++
 Gustavo>  3 files changed, 60 insertions(+), 60 deletions(-)
 Gustavo>  delete mode 100644 toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 Gustavo>  create mode 100644 toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
