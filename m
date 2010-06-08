From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jun 2010 23:24:42 +0200
Subject: [Buildroot] [PATCH 4/4] gstreamer: remove --disable-registry
	from configure options
In-Reply-To: <1275761030-20955-5-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sat, 5 Jun 2010 20:03:50 +0200")
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
	<1275761030-20955-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <87mxv5i5et.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> --disable-registry has no dependency on libxml2 and should not be
 llandwerlin> linked to BR2_PACKAGE_GSTREAMER_LIBXML2. If we want to disable
 llandwerlin> registry then we should add another option.

Committed, thanks.

-- 
Bye, Peter Korsgaard
