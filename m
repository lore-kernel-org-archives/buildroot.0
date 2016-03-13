From: Pauli Sundberg <susundberg@gmail.com>
Date: Sun, 13 Mar 2016 20:12:56 +0200
Subject: [Buildroot] [PATCH 0/1] Add SVN support for kernel and u-boot
Message-ID: <CAGC_hNmLj+-XtrMjwQ2WTnAp6rThZ6BbxfOdWB13aG+OT93Gfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all! I was asking from irc-channel should i send this patch to
bring back the SVN support for u-boot and kernel packages that are
used in certain project. Due the outside world we are unfortunately
unable to use git or other version controls. The patch mainly adds the
selection, all heavy lifting has been already done with the other
repository work.

Pauli Sundberg (1):
  Add SVN repository support for linux and uboot

 boot/uboot/Config.in |  7 +++++--
 boot/uboot/uboot.mk  |  4 +++-
 linux/Config.in      | 11 +++++++++--
 linux/linux.mk       |  3 +++
 4 files changed, 20 insertions(+), 5 deletions(-)

-- 
1.9.1
