From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 19 Sep 2016 15:06:31 +0200
Subject: [Buildroot] (fwd) RFC PATCH [wbx@uclibc-ng.org]
Message-ID: <20160919130631.GH7322@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Forwarded message from Waldemar Brodkorb <wbx@uclibc-ng.org> -----

Date: Mon, 19 Sep 2016 14:41:49 +0200
From: Waldemar Brodkorb <wbx@uclibc-ng.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
To: devel at uclibc-ng.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Vincent Ren-Wei Chen <vincentc@andestech.com>,
	Che-Wei Chuang <cnoize@andestech.com>, buildroot at buildroot.org
Subject: RFC PATCH

Hi,

I would like to suggest following patch to have a single libc
library. This would solve a lot of problems in buildroot and other
buildsystems.

I would love to make a release at the end of this month.

What do you think about it?

For buildroot people, here is a patch for testing:
http://debug.openadk.org/buildroot/0001-experimental-uClibc-ng-patches.patch

This will solve a lot of old autobuild failures, f.e. the libarchive
static stuff.

I worked for many hours on this, so don't be too harsh with your
feedback ;)

Thanks in advance!
 Waldemar

P.s.: I know it is a big patch, but I see no good chances to split
it in pieces.
