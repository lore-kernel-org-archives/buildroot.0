From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Jan 2014 15:14:28 +0100
Subject: [Buildroot] [PATCH 4 of 5 v3] squashfs3: remove deprecated
	package/rootfs
In-Reply-To: <4ddef97a82357d616713.1388764973@argentina> (Thomas De
 Schampheleire's message of "Fri, 03 Jan 2014 17:02:53 +0100")
References: <patchbomb.1388764969@argentina>
 <4ddef97a82357d616713.1388764973@argentina>
Message-ID: <874n5b9b5n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > ---
 > Note: I did not add a legacy entry for  BR2_TARGET_ROOTFS_SQUASHFS4 because
 > it's simply removed, its role now played by the parent
 > BR2_TARGET_ROOTFS_SQUASHFS. Therefore, I don't think we need legacy symbols
 > in this case, right?

Committed with the now unused BR2_DEPRECATED_SINCE_2010_05 symbol
removed, thanks.

-- 
Bye, Peter Korsgaard
