From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 00:03:20 +0200
Subject: [Buildroot] [PATCH] Repair initramfs dependancies after move to
	fs
In-Reply-To: <1271687689-344-1-git-send-email-will_wagner@carallon.com> (Will
	Wagner's message of "Mon, 19 Apr 2010 15:34:49 +0100")
References: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
Message-ID: <87r5mbaymv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> The restructure for building root filesystems changed the target name
 Will> for the initramfs file, to build the file the trget is now
 Will> initramfs-root but the generated file is rootfs.initramfs

Committed, thanks.

-- 
Bye, Peter Korsgaard
