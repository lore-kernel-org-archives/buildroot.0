From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 May 2012 11:19:34 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: bump version to
	1.15.2, update config files
In-Reply-To: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 9 May 2012 01:01:21 +0200")
References: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y5p1ww2h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Update the version of crosstool-Ng used, bump to 1.15.2.
 Yann> Also, update the bundled config files to match the new version.

Committed, thanks. I had to fixup our ctng handling for changes in the
copy_toolchain_lib_root_api by Thomas, but that's unrelated to this
version bump.

I've also adjusted the default uClibc version/mode to match what we're
using for the internal toolchain (0.9.33.1 / NPTL).

-- 
Bye, Peter Korsgaard
