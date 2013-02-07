From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 22:58:42 +0100
Subject: [Buildroot] [PATCH v3] Post-image addition, and customize removal
Message-ID: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the third version of the post-image addition and customize
removal patch set.

Compared to version 2:

 * Slightly adjust the post-image config option prompt to use "Custom
   scripts" instead of "Custom script"

 * Add Acked-by from Samuel Martin

 * Slightly improve the documentation as per the suggestion of Samuel.

 * Add one patch to change "Custom script" to "Custom scripts" for the
   post-build scripts config option.

Best regards,

Thomas
