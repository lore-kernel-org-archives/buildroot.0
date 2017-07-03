From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 17:53:12 +0200
Subject: [Buildroot] [PATCH 1/5] support/check-package: don't check
	filenames of hashes
In-Reply-To: <eafeec501266452fc7973871c7853bf6d016dfce.1498428166.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 26 Jun 2017 00:03:37 +0200")
References: <cover.1498428166.git.yann.morin.1998@free.fr>
 <eafeec501266452fc7973871c7853bf6d016dfce.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <87shid7c0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we check that the filenames in hash lists do not contain
 > a slash '/' character, because all we are checking so far are the
 > downloaded archives, and we explicitly need the filename to not contain
 > a directory component at all.

 > However, we're soon to also check the hashes of the license files in
 > packages sources, and those license files may be at any arbitrary
 > directory-depth in the packages source tree, and thus two or more
 > license files may have the same basename.

Committed after adjusting the commit message as suggested by Richardo,
thanks.

-- 
Bye, Peter Korsgaard
