From: Will Wagner <will_wagner@carallon.com>
Date: Mon,  5 Dec 2011 18:08:14 +0000
Subject: [Buildroot] [PATCH 0/4] Improved uClibc support with ct-ng
	generated toolchain
Message-ID: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there is a hard coded uClibc config file when building
with crosstools-ng. This patch:
- Allows user to pick uClibc version when using ct-ng
- Allows user to select nptl when using 0.9.32
- Supplys better default uClibc config files (Using same config files as for in$
- Allows user to specify a custom uClibc config file 

Split patch into four and made changes suggested from Yann's feedback
