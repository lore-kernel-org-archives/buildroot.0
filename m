From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 31 Jul 2008 10:08:08 +0200
Subject: [Buildroot] missing acl.h for host mtd-utils
In-Reply-To: <1217483230.6143.29.camel@kokopelli>
References: <1217483230.6143.29.camel@kokopelli>
Message-ID: <20080731080808.GA5288@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 30, 2008 at 10:47:10PM -0700, Brian Beattie wrote:
>I think I have tracked this down, two of the missing include files and
>the library were due to a missing package on my system, but I still
>don't have an acl.h and I'm not sure where it would come from.  My
>development system is Ubuntu.  If somebody knows what package contains
>acl.h I'd appreciate hearing.  In the mean time I have worked around
>this by copying the target acl patch to a host package.

It lives in libacl1-dev and it sounds odd (and bloated) that mtd can't
live without it. I suggest to fix mtd (but i didn't look, admittedly).
