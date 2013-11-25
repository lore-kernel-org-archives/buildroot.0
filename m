From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Mon, 25 Nov 2013 13:55:35 +0100
Subject: [Buildroot] [PATCH v2] lftp: new package.
Message-ID: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here comes a second version of the patch to include lftp in buildroot.

Improvements from v1:
 * Config.in
   * Typo corrected
 * lftp.mk
   * LFTP_SOURCE removed
   * LFTP_AUTORECONF set to YES
   * POST_INSTALL_TARGET factorized a lot
 * patches:
   * Signed-off
   * Patch the m4 file instead of the configure script

Best regards,
Arnaud.
