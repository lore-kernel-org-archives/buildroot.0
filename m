From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Sep 2019 22:47:57 +0200
Subject: [Buildroot] [PATCH] package/qemu: fixup patches after 3.1.1 bump
In-Reply-To: <20190903143058.12845-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 3 Sep 2019 16:30:58 +0200")
References: <20190903143058.12845-1-peter@korsgaard.com>
Message-ID: <87blw13y4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit a0b032ad859b2e6e8cd (package/qemu: security bump to version 3.1.1)
 > bumped the version but didn't update the patch subdirectory name, so the
 > patches are now ignored.

 > Fix that by renaming the directory.  Drop
 > 0002-configure-improve-usbfs-check.patch as that is now upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
