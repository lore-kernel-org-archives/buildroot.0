From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Apr 2013 23:24:23 +0200
Subject: [Buildroot] [PATCH] Update kconfig code
Message-ID: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are two patches that update our kconfig code to a more recent
kernel version. Initially, my goal was to be able to bring in Yann's
patch that fixes the randomization of kconfig choices, but it turned
out that the patch doesn't work completely. However, updating the
kconfig code still makes sense, and brings the additional 'make
olddefconfig' target.

Best regards,

Thomas
