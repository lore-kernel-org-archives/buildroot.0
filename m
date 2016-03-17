From: Pauli Sundberg <susundberg@gmail.com>
Date: Thu, 17 Mar 2016 19:07:50 +0200
Subject: [Buildroot] [PATCH v2 0/2] Add Svn support for kernel and u-boot
In-Reply-To: <87oaaif6zv.fsf@dell.be.48ers.dk>
References: <87oaaif6zv.fsf@dell.be.48ers.dk>
Message-ID: <1458234472-4741-1-git-send-email-susundberg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all! This is second round to submit patch for uboot and kernel to re-add the SVN support. Thanks for Peter Korsgaard from the previous feedback.

Pauli Sundberg (2):
  Add SVN repository support for u-boot
  Add SVN repository support for kernel

 boot/uboot/Config.in |  9 ++++++---
 boot/uboot/uboot.mk  |  4 +++-
 linux/Config.in      | 12 +++++++++---
 linux/linux.mk       |  3 +++
 4 files changed, 21 insertions(+), 7 deletions(-)

-- 
1.9.1
