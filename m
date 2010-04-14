From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 09:54:48 +0200
Subject: [Buildroot] [PATCH 18/41] cairo: bump to 1.8.10
In-Reply-To: <1271199974-30434-19-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:05:51 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-19-git-send-email-llandwerlin@gmail.com>
Message-ID: <87zl16h3jr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/cairo/cairo-1.6.4-directfb-all.patch | 1012 --------------------------
 llandwerlin>  package/cairo/cairo-1.8.8-directfb.patch     |   39 +
 llandwerlin>  package/cairo/cairo.mk                       |    5 +-
 llandwerlin>  3 files changed, 42 insertions(+), 1014 deletions(-)
 llandwerlin>  delete mode 100644 package/cairo/cairo-1.6.4-directfb-all.patch
 llandwerlin>  create mode 100644 package/cairo/cairo-1.8.8-directfb.patch

why not name it cairo-1.8.10-directfb.patch? Are you the author of the
patch? Has it been pushed upstream? It's nice if you add (git-like)
patch header to the file with that info.

-- 
Bye, Peter Korsgaard
