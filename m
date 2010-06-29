From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 28 Jun 2010 18:45:13 -0700
Subject: [Buildroot] [PATCH 0/3] Fix for kexec,
	enable libintl for findutils and netcat if locale is enabled
Message-ID: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 1/3 fixes a build issue in kexec noted:
http://lists.busybox.net/pipermail/buildroot/2009-August/028973.html
Where the BUILD_CC is the same as the TARGET_CC, this patch sets the BUILD_CC to the HOSTCC.

Patch 2/3 and 3/3 add libintl to findutils and netcat, if locale is enabled.
