From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Nov 2013 12:15:48 +0100
Subject: [Buildroot] [PATCH 0 of 2 for-2013.11] vim: fix with locale support
Message-ID: <patchbomb.1384859748@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/vim/Config.in                    |    1 +
 package/vim/vim-0001-fix-nls-check.patch |  120 +++++++++++++++++++++++++++
 package/vim/vim.mk                       |    2 +-
 3 files changed, 122 insertions(+), 1 deletions(-)
