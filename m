From: akennedy at wpid-am.com <akennedy@wpid-am.com>
Date: Fri, 14 Jan 2011 12:08:34 -0600
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.2 + change URL to
	match kernel.org
In-Reply-To: <1295028514-14006-1-git-send-email-akennedy@wpid-am.com>
References: <1295028514-14006-1-git-send-email-akennedy@wpid-am.com>
Message-ID: <1295028514-14006-2-git-send-email-akennedy@wpid-am.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
